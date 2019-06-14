CREATE TABLE IF NOT EXISTS `wirecard`.`dim_fee_origin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fee_id` INT NULL,
  `payment_form_id` INT NULL,
  `parcel_number` INT NULL,
  `fixed_tax_percentual` FLOAT NULL,
  `parcel_tax_percentual` FLOAT NULL,
  `fixed_tax_value` FLOAT NULL,
  `is_account_fixed_table_fee` TINYINT NULL,
  `is_account_payment_fee` TINYINT NULL,
  `is_channel_fixed_table_fee` TINYINT NULL,
  `is_fixed_table_fee` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_payment_form_id_idx` (`payment_form_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_form_id`
    FOREIGN KEY (`payment_form_id`)
    REFERENCES `wirecard`.`payment_form` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


CREATE TABLE IF NOT EXISTS `wirecard`.`dim_account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `account_id` INT NULL,
  `login` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  `sobrenome` VARCHAR(45) NULL,
  `fee_type` INT NULL,
  `negotiated_tax` TINYINT NULL
  PRIMARY KEY (`id`),
  INDEX `fk_account_id_idx` (`account_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_id`
    FOREIGN KEY (`account_id`)
    REFERENCES `wirecard`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

CREATE TABLE IF NOT EXISTS `wirecard`.`fato` (
  `dim_account_id` INT NOT NULL,
  `dim_fee_origen_id` INT NOT NULL,
  `required_fixed_fee_value` FLOAT NULL,
  `required_percentual_fee_value` FLOAT NULL,
  `antecipation_fee_value` FLOAT NULL,
  `dim_fee_origin_id` INT NOT NULL,
  PRIMARY KEY (`dim_account_id`, `dim_fee_origen_id`),
  INDEX `fk_fato_dim_fee_origin1_idx` (`dim_fee_origin_id` ASC) VISIBLE,
  CONSTRAINT `fk_fato_dim_fee_origin1`
    FOREIGN KEY (`dim_fee_origin_id`)
    REFERENCES `wirecard`.`dim_fee_origin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
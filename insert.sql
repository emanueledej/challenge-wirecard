INSERT INTO wirecard.dim_account (
id_account,
    login,
    name,
    last_name,
    fee_type,
    negotiated_tax
)
select 
wirecard.account.id id_account,
wirecard.member.login login,
wirecard.member.name name,
wirecard.member.last_name last_name,
wirecard.account.fee_type fee_type,
wirecard.account.negotiated_tax negotiated_tax
from wirecard.account
inner join wirecard.member
on wirecard.member.id = wirecard.account.id
where wirecard.member.enable = 1

INSERT INTO dim_fee_origin(
    id_fee,
payment_form_id,
parcel_number,
fixed_tax_percentual,
parcel_tax_percentual,
fixed_tax_value,
is_account_fixed_table_fee,
is_account_payment_fee,
is_channel_fixed_table_fee,
is_fixed_table_fee,
)

select 
	wirecard.account_fixed_table_fee.id as fee_id,
    wirecard.account_fixed_table_fee.payment_form_id as payment_form_id,
    wirecard.account_fixed_table_fee.parcel_number as parcel_number,
    wirecard.account_fixed_table_fee.fixed_tax_percentual as fixed_tax_percentual,
    wirecard.account_fixed_table_fee.parcel_tax_percentual as parcel_tax_percentual,
    wirecard.account_fixed_table_fee.fixed_tax_value as fixed_tax_value,
    true as is_account_fixed_table_fee,
	false is_account_payment_fee,
	false is_channel_fixed_table_fee,
	false is_fixed_table_fee
from wirecard.account_fixed_table_fee

    
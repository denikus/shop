# This migration comes from solidus_braintree (originally 20190911141712)
class Add3dSecureToBraintreeConfiguration < SolidusSupport::Migration[4.2]
  def change
    add_column :solidus_paypal_braintree_configurations, :three_d_secure, :boolean, null: false, default: false
  end
end

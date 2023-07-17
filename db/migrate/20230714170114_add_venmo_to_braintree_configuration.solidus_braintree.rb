# This migration comes from solidus_braintree (originally 20220104150301)
class AddVenmoToBraintreeConfiguration < ActiveRecord::Migration[5.0]
  def change
    add_column :solidus_paypal_braintree_configurations, :venmo, :boolean, null: false, default: false
  end
end

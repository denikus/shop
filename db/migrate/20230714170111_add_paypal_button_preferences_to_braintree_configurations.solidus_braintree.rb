# This migration comes from solidus_braintree (originally 20190705115327)
class AddPaypalButtonPreferencesToBraintreeConfigurations < ActiveRecord::Migration[5.1]
  def change
    add_column :solidus_paypal_braintree_configurations, :preferences, :text
  end
end

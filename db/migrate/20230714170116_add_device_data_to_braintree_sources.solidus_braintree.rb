# This migration comes from solidus_braintree (originally 20230210104310)
class AddDeviceDataToBraintreeSources < ActiveRecord::Migration[5.1]
  def change
    add_column :solidus_paypal_braintree_sources, :device_data, :string
  end
end

class AddAddressToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :address, :string
  end
end

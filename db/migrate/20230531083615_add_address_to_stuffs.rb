class AddAddressToStuffs < ActiveRecord::Migration[7.0]
  def change
    add_column :stuffs, :address, :string
  end
end

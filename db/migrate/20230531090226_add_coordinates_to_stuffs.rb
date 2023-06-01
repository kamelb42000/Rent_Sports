class AddCoordinatesToStuffs < ActiveRecord::Migration[7.0]
  def change
    add_column :stuffs, :latitude, :float
    add_column :stuffs, :longitude, :float
  end
end

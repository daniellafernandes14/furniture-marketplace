class AddCoordinatesToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :latitude, :float
    add_column :products, :longitude, :float
  end
end

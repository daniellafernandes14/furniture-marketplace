class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :colour
      t.string :material

      t.timestamps
    end
  end
end

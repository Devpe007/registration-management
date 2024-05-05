class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, limit: 100, null: false
      t.float :price, null: false
      t.text :description
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end

class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name, limit: 50, null: false
      t.string :email, limit: 100, index: { unique: true }
      t.string :phone, limit: 50, index: { unique: true }
      t.string :address, limit: 100

      t.references :user, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end

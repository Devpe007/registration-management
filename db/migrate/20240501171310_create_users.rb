class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 50, null: false
      t.string :email, limit: 100, index: { unique: true }, null: false
      t.string :phone, index: { unique: true }
      t.string :password, limit: 100, null: false
      t.date :born_at

      t.timestamps null: false
    end
  end
end

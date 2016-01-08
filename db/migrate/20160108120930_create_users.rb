class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, uniqueness: true, limit: 50
      t.string :password_hash

      t.timestamps null: false
    end
  end
end

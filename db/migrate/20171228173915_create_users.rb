class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true, null: false
      t.string :lastname
      t.string :firstname
      t.string :password_digest, null: false
      t.timestamp :confirmed_at

      t.timestamps
    end
  end
end
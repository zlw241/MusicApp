class CreateUsersReplacementTable < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.timestamps
    end
  end
end

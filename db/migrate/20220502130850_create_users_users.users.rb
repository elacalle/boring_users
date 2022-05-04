# This migration comes from users (originally 20220502130604)
class CreateUsersUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users_users do |t|
      t.string :uid, index: { unique: true }
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.timestamps
    end
  end
end

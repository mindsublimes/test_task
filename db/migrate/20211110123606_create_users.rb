class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :confirm_password
      t.boolean :user_sign_in
      t.timestamps
    end
  end
end

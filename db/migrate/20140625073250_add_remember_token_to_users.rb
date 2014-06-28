class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
     # To automatically establish user login upon browser restart
     add_column :users, :remember_token, :string
     add_index  :users, :remember_token
  end
end

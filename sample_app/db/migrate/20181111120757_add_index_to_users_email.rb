class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    # add_index :users, :email, unique:true usersテーブルにnameと
    add_column :users, :password_digest, :string
  end
end

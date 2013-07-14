class RenameColumnPass < ActiveRecord::Migration
  def change
    rename_column :users, :pass, :password_digest
  end
end

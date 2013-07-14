class RenameCol < ActiveRecord::Migration
  def change
    rename_column(:users, :pass, :password_digest)
  end
end

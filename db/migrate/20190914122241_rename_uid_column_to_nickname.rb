class RenameUidColumnToNickname < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :uid, :nickname
  end
end

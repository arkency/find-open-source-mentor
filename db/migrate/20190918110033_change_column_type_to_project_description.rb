class ChangeColumnTypeToProjectDescription < ActiveRecord::Migration[5.2]
  def up
    change_column :projects, :description, :text
    change_column :projects, :name, :string, null: false
  end

  def down
    change_column :projects, :description, :string
    change_column :projects, :name, :string
  end
end

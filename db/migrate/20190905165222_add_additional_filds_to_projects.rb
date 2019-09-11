class AddAdditionalFildsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :description, :string
    add_column :projects, :link, :string
    add_column :projects, :user_id, :integer
  end
end

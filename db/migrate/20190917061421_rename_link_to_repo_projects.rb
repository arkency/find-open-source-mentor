class RenameLinkToRepoProjects < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :link, :repository
  end
end

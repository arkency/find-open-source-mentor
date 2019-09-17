class AddRepoIdToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :repository, foreign_key: true
  end
end

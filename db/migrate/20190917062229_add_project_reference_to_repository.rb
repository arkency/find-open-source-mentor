class AddProjectReferenceToRepository < ActiveRecord::Migration[5.2]
  def change
    add_reference :repositories, :project, foreign_key: true
  end
end

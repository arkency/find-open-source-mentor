class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.string :link

      t.timestamps
    end
  end
end

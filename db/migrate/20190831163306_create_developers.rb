class CreateDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :developers do |t|
      t.string :name
      t.boolean :junior, default: false
      t.timestamps
    end
  end
end

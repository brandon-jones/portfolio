class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :link
      t.text :details
      t.string :tags

      t.timestamps
    end
  end
end

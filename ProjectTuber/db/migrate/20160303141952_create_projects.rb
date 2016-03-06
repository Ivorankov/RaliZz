class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :link_to_source
      t.string :link_to_video
      t.references :user
      t.references :images
      t.timestamps null: false
    end
  end
end

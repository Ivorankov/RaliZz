class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :ip
      t.timestamps null: false
      t.references :projects
    end
  end
end

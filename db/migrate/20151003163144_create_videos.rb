class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.index :id
      t.string :title
      t.string :description
      t.string :video
      t.timestamps null: false
    end
  end
end

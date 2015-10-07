class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.index :id
      t.string :title
      t.string :content
      t.string :image, default: 'no_image.png'
      t.timestamps null: false
    end
  end
end

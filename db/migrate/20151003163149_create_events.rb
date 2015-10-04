class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.index :id
      t.string :title
      t.string :address
      t.datetime :started_at
      t.string :image
      t.timestamps null: false
    end
  end
end

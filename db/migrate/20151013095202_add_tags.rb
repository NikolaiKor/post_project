class AddTags < ActiveRecord::Migration
  def change
    add_column :posts, :tag_ids, :integer, array: true, default: []
    add_index :posts, :tag_ids, using: 'gin'

    add_column :videos, :tag_ids, :integer, array: true, default: []
    add_index :videos, :tag_ids, using: 'gin'

    add_column :events, :tag_ids, :integer, array: true, default: []
    add_index :events, :tag_ids, using: 'gin'
  end
end

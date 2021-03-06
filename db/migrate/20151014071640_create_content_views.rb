class CreateContentViews < ActiveRecord::Migration
  def up
    execute("
      CREATE OR REPLACE VIEW content_views AS
        SELECT id, title, 'Post' as type, image, content, NULL AS description, NULL AS started_at, NULL AS address, tag_ids, created_at, updated_at FROM posts
        UNION
        SELECT id, title, 'Event' as type, image, NULL AS content,  NULL AS description, started_at, address, tag_ids, created_at, updated_at FROM events
        UNION
        SELECT id, title, 'Video' as type, NULL AS image, NULL AS content, description, NULL AS started_at, NULL AS address, tag_ids, created_at, updated_at FROM videos;
    ")
  end

  def down
    execute('DROP VIEW content_views;')
  end
end

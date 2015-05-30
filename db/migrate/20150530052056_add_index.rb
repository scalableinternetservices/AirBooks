class AddIndex < ActiveRecord::Migration
  def change
    add_index(:books, :image_file_name, name: 'image_tile_index',order: {created_at: :desc})
  end
end

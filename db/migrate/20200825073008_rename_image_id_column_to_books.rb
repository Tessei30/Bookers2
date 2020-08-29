class RenameImageIdColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :image_id, :profile_image_id
  end
end

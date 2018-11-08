class RenameContentColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :content, :comment
  end
end

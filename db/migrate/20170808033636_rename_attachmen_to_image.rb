class RenameAttachmenToImage < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :attachment, :image
  end
end

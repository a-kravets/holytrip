class RenameAttachmentUrlToPhoto < ActiveRecord::Migration[5.2]
  def change
    rename_column :attachments, :attachment_url, :photo
  end
end

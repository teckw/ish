class AddAttachmentIpicToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :ipic
    end
  end

  def self.down
    remove_attachment :items, :ipic
  end
end

class AddAttachmentPosterToArticles < ActiveRecord::Migration[4.2]
  def self.up
    change_table :articles do |t|
      t.attachment :poster
    end
  end

  def self.down
    remove_attachment :articles, :poster
  end
end

class Article < ApplicationRecord
    has_rich_text :content
    extend FriendlyId
    friendly_id :title, use: :slugged

    has_attached_file :poster, styles: { medium: "300x200#", thumb: "250x200#" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :poster, content_type: /\Aimage\/.*\z/

    has_many :comments
    has_many :users, through: :comments

    def should_generate_new_friendly_id?
        title_changed? || super
    end
end

class Article < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :article_categories
    has_many :categories, through: :article_categories

    validates :title, presence: true
    validates :content, presence: true, length: {minimum: 50, maximum: 500}

end

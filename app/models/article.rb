class Article < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :article_categories
    has_many :categories, through: :article_categories
    # accepts_nested_attributes_for :categories 
    # validates :content,  presence: true, length: {minimum:3, maximum:1000}
end

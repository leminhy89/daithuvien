class Subcategory < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    belongs_to :category
    has_many :books
    
    validates :name, presence: true
    validates :category_id, presence: true
end

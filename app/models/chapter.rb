class Chapter < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    belongs_to :book
    
    validates :name, presence: true
    validates :book_id, presence: true
    validates :content, presence: true
end

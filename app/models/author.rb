class Author < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    has_many :book
    validates :author_name, presence: true
    
    def self.search(query)
        where("author_name like ?", "%#{query}%")
    end
end

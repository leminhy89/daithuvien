class Type < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    has_many :books
    
    validates :name , presence: true
end

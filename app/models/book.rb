class Book < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    has_many :chapters
    belongs_to :subcategory
    belongs_to :type
    belongs_to :status
    belongs_to :countview
    belongs_to :author
    
    validates :name , presence: true
    validates :subcategory_id , presence: true
    validates :status_id , presence: true
    validates :type_id , presence: true
    validates :author_id , presence: true
    validates :description , presence: true
    
    has_attached_file :image, :default_url => ActionController::Base.helpers.asset_path('cover_default.jpg')
    
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    def self.search(query)
        where("name like ?", "%#{query}%")
    end
    
    def self.advsearch(query)
        where("LOWER(name) like ? OR LOWER(books.slug) like ? OR LOWER(author_name) like ?","%#{query.downcase}%","%#{query.downcase}%","%#{query.downcase}%")
    end
end

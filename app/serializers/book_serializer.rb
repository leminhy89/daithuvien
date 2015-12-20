class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :slug, :haschapters

  
  has_one :author
  has_one :subcategory
  has_one :status
  
  
  def haschapters
    count = object.chapters.size
  end
  
  #def projects
  #  collection = object.projects.to_a
  #  { count: collection.length,
  #    updated_at: collection.map(&:updated_at).max,
  #    url: projects_url }
  #end
  
end

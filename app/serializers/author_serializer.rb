class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :author_name, :slug
end

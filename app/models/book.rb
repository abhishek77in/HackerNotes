class Book
  include Mongoid::Document
  field :name, type: String
  field :url, type: String
  field :description, type: String
end

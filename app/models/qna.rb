class Qna
  include Mongoid::Document
  field :title, type: String
  field :url, type: String
  field :excerpt, type: String
end

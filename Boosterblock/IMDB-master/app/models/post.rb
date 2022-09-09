class Post
  include Mongoid::Document
  field :title, type: String
  field :thumbnail_url, type: String
  field :detail, type: String
  field :release_date, type: DateTime
  field :movie_type, type: String
  field :director, type: String
  field :language, type: String
  field :genre, type: String
  field :duration, type: String
  field :rated, type: String
  field :media_formats, type: String
  field :origin_countries, type: String
  field :production_companies, type: Array
  field :distributors, type: Array
  field :sucursal, type: String
  field :cantStock, type: String

end

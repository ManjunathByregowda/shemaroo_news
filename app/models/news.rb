class News

  include Mongoid::Document
  include Mongoid::Timestamps

  field :news_id, type: String
  field :name, type: String
  field :description, type: String
  field :type, type: String
  field :thumbnail, type: String
  field :language, type: String
  field :duration, type: String
  field :mp4, type: String
  field :hls, type: String
  field :mp3, type: String

  validates_uniqueness_of :news_id
end

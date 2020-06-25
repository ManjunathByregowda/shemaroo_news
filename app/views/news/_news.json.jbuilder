json.extract! news, :id, :news_id, :name, :description, :type, :thumbnail, :language, :duration, :mp4, :hls, :mp3, :created_at, :updated_at
json.url news_url(news, format: :json)

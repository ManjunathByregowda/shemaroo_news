namespace :news do

  desc "Updating News to database"
  task upload: :environment do
    file = Time.now.to_s.gsub(" ", "_") + ".txt"
    File.open(file, "w") {|f| f.write("write your stuff here") }
    http_headers = { "Content-Type" => "application/x-www-form-urlencoded" }
    data = { "duration" => "15", "lang" => "en", "token" => "d47ce3f84f0995d66e1aba38f68d6c19"}
    response = Typhoeus::Request.post("https://partner-api.editorji.com/playlist", :body => data,:headers => http_headers)

    result = JSON.parse(response.body)

    if result['data'].present?
      result['data']['data']['newslist'].each do |item|
        news = News.find_by(news_id: item['id'])
        if news.nil?
          News.create(news_id: item['id'],
            name: item['name'],
            description: item['description'],
            type: item['type'],
            thumbnail: item['thumbnail'],
            language: item['language'],
            duration: item['duration'],
            mp4: item['mp4'],
            hls: item['hls'],
            mp3: item['mp3'])
        end
      end
    end
  end
end

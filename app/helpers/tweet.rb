helpers do
  def tweet(text)
    env_config = YAML.load_file(APP_ROOT.join('config', 'twitter.yaml'))

    env_config.each do |key, value|
      ENV[key] = value
    end

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_SECRET']
    end
    client.update(text)
  end
end

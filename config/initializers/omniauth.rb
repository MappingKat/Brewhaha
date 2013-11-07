OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  # provider :twitter, "VxT5wmY74OLESBxJtTH5g", "9qyuWknwsjmrwomP58f9cNYmugUEQ7Hhwz7KZVZE8"

end

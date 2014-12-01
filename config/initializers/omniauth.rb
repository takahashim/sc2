# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_app_id,
                       Rails.application.secrets.facebook_secret,
           :scope => 'email'
  provider :twitter, Rails.application.secrets.twitter_key,
                       Rails.application.secrets.twitter_secret
  
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
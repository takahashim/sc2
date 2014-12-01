class User < ActiveRecord::Base
  def self.create_from_omniauth(auth)
    User.find_or_create_by(provider: auth.provider,
      uid: auth.uid) do |user|
        user.name = auth.info.name
        user.token = auth.credentials.token
    end
  end
end

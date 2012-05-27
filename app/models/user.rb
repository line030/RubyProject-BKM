class User < ActiveRecord::Base
  acts_as_authentic do |config|
    #	Add	custom	conﬁguration	options	here
    config.crypto_provider = Authlogic::CryptoProviders::MD5

    belongs_to :address
    has_many :workout_sessions
    has_many :aims
  end
end

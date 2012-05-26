class User < ActiveRecord::Base
  acts_as_authentic do |config|
    #	Add	custom	conﬁguration	options	here
    #conﬁg.crypto_provider = Authlogic::CryptoProviders::MD5
    config.crypto_provider = Authlogic::CryptoProviders::MD5
    belongs_to :address
  end
end

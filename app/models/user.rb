class User < ActiveRecord::Base
  validates_presence_of :forename
  validates_presence_of :surname
  validates_presence_of :date_of_birth
  validates :gender , :presence=>true

  acts_as_authentic do |config|
    # Add custom conﬁguration options here
    config.crypto_provider = Authlogic::CryptoProviders::MD5



    belongs_to :address
    has_many :workout_plans
    has_many :workout_sessions
    has_many :aims
    has_many :exercises
    has_many :workout_days

    #accepts_nested_attributes_for :address, :allow_destroy => true

  end
end

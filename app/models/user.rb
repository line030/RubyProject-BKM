class User < ActiveRecord::Base
  #validates_presence_of :forename
  #validates_presence_of :surname
  #validates_presence_of :date_of_birth
  #validates :gender , :presence=>true

  acts_as_authentic do |config|
    # Add custom conﬁguration options here
    config.crypto_provider = Authlogic::CryptoProviders::MD5

    has_one :address, :dependent => :delete
    has_many :workout_plans
    has_many :workout_sessions
    has_many :aims
    has_many :exercises
    has_many :workout_days
  end

  def send_registration_mail
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.registration(self).deliver
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end

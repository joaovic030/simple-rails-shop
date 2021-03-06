class Coupon < ApplicationRecord
  before_create :set_token

  validates :expired_date, :percentage, presence: true

  protected

  def set_token
    self.token = loop do
      try_token = SecureRandom.urlsafe_base64(nil, false)
      break try_token unless Coupon.exists?(token: try_token)
    end
  end
end

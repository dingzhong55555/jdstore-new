class Order < ApplicationRecord
  before_create :generate_token
  belongs_to :user
  has_many :product_lists

  def paid!
    self.update_columns(:is_paid => true)
  end

  def set_payment_with!(method)
    self.update_columns(:payment => method)
  end

  def generate_token
    self.token = SecureRandom.uuid
  end

end

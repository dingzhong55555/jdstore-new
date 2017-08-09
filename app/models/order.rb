class Order < ApplicationRecord
  belongs_to :user
  has_many :product_lists
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end


  def paid!
    self.update_columns(:is_paid => true)
  end

  def set_payment_with!(method)
    self.update_columns(:payment => method)
  end
end

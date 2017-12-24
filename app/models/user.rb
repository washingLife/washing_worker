class User < ApplicationRecord
  has_many :orders
  has_one :user_card

  has_many :coupons
  def to_s
    "User #{self.id}"
  end
end
class User < ApplicationRecord
  has_many :orders

  def to_s
    "User #{self.id}"
  end
end
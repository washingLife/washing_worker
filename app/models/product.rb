class Product < ApplicationRecord
  belongs_to :category, required: true

  has_one :price, dependent: :destroy

  def to_s
    self.name
  end  
end

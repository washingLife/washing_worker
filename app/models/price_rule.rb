class PriceRule < ApplicationRecord
  belongs_to :city
  belongs_to :category
end
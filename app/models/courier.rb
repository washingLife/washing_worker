class Courier < ApplicationRecord
  has_and_belongs_to_many :stations

  def to_s
    "Courier #{self.id}"
  end
end
class Order < ApplicationRecord
  include Workflow

  belongs_to :category
  belongs_to :user
  belongs_to :user_address
  has_many :items

  has_many :waybills

  workflow_column :courier_status 

  workflow do
    state :new do
      event :next, transitions_to: :wuliu_qu_paidan
    end
    state :wuliu_qu_paidan do 
      event :next, transitions_to: :wuliu_qu_jiedan
      event :prev, transitions_to: :wuliu_qu_paidan
    end
    state :wuliu_qu_jiedan do 
      event :next, transitions_to: :wuliu_qu_qianshou
      event :prev, transitions_to: :wuliu_qu_judan
    end
  end

  def next
    if self.new?
      create_waybill
    end
  end

  def prev
    if self.wuliu_qu_paidan?
      create_waybill
    end
  end

  private 
  def create_waybill
    station = self.user_address.city.stations.sample
    courier = station.couriers.sample

    self.waybills.create(sender: self.user, receiver: courier, from_address: user_address.address, to_address: station.address)
  end
end
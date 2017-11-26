class CreateCouriersStations < ActiveRecord::Migration[5.1]
  def change
    create_table :couriers_stations do |t|
      t.references :courier
      t.references :station

      t.timestamps
    end
  end
end

class AddCityToStations < ActiveRecord::Migration[5.1]
  def change
  	add_reference :stations, :city
  end
end

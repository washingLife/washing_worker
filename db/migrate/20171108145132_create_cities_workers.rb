class CreateCitiesWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :cities_workers do |t|
      t.references :city
      t.references :worker

      t.timestamps
    end
  end
end

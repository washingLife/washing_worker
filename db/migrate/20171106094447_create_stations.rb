class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :name
      t.boolean :is_del, default: false

      t.timestamps
    end
  end
end

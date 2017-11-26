class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.boolean :is_del, default: false

      t.timestamps
    end
  end
end

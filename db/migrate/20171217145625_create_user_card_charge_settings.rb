class CreateUserCardChargeSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_card_charge_settings do |t|
      t.float :min, default: 0
      t.float :money_give, default: 0

      t.timestamps
    end
  end
end

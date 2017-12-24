class CreateUserCardLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_card_logs do |t|
      t.integer :kind, default: 0
      t.float :real_money, default: 0
      t.float :fake_money, default: 0
      t.references :loggable, polymorphic: true
      t.references :user_card

      t.timestamps
    end
  end
end

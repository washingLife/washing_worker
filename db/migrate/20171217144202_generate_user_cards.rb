class GenerateUserCards < ActiveRecord::Migration[5.1]
  def change
  	User.all.each do |user|
      user.create_user_card
    end
  end
end

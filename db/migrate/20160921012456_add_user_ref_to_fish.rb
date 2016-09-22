class AddUserRefToFish < ActiveRecord::Migration[5.0]
  def change
    add_reference :fish, :user, foreign_key: true
  end
end

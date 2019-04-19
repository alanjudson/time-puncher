class AddUserToPunchtime < ActiveRecord::Migration[5.2]
  def change
    add_reference :punchtimes, :user, foreign_key: true
  end
end

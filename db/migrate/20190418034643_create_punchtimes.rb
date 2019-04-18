class CreatePunchtimes < ActiveRecord::Migration[5.2]
  def change
    create_table :punchtimes do |t|
      t.string :punch_type
      t.string :description
      t.datetime :time

      t.timestamps
    end
  end
end

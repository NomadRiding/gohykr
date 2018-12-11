class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :open_seat
      t.string :taken_seat
      t.belongs_to :itinerary, foreign_key: true

      t.timestamps
    end
  end
end

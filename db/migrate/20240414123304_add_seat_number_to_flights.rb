class AddSeatNumberToFlights < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :seat_number, :string
  end
end

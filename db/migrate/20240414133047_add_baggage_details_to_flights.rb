class AddBaggageDetailsToFlights < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :cabin_bag, :string
    add_column :flights, :checked_bags, :string
  end
end

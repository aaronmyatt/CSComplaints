class UpdateLocationOnComplaints < ActiveRecord::Migration
  def change
    remove_column :complaints, :lat
    remove_column :complaints, :long

    add_column :complaints, :address, :string
    add_column :complaints, :latitude, :float, null: false
    add_column :complaints, :longitude, :float, null: false
  end
end

class RemoveNullCheckOnLatLng < ActiveRecord::Migration
  def change
    change_column :complaints, :latitude, :float, :null => false
    change_column :complaints, :longitude, :float, :null => false
  end
end

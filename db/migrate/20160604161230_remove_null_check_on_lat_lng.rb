class RemoveNullCheckOnLatLng < ActiveRecord::Migration
  def self.up
    change_column :complaints, :latitude, :float, :null => true
    change_column :complaints, :longitude, :float, :null => true
  end
  def self.down
    change_column :complaints, :latitude, :float, :null => false
    change_column :complaints, :longitude, :float, :null => false
  end
end

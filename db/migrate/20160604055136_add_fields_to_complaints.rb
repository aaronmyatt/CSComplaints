class AddFieldsToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :title, :string, null: false
    add_column :complaints, :description, :text, null: false
    add_column :complaints, :lat, :string
    add_column :complaints, :long, :string
  end
end

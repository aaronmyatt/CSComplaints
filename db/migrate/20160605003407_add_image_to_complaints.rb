class AddImageToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :image, :string
  end
end

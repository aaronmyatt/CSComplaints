class AddAgencyToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :agency, :string
  end
end

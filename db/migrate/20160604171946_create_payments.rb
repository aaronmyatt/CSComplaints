class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.user :references
      t.complaint :references
      t.string :provider

      t.timestamps null: false
    end
  end
end

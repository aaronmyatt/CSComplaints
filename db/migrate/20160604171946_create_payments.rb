class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.references :user
      t.references :complaint
      t.string :provider

      t.timestamps null: false
    end
  end
end

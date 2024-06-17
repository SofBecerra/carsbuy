class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.date :purchase_date

      t.timestamps
    end
  end
end

class RemoveColumnFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :purchase_date, :date
  end
end

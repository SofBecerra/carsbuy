class AddColumnsToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :available, :boolean, default: true
  end
end

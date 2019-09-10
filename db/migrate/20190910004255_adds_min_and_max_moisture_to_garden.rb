class AddsMinAndMaxMoistureToGarden < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :max_moisture, :float
    add_column :gardens, :min_moisture, :float
    add_column :gardens, :auto_water, :boolean
  end
end

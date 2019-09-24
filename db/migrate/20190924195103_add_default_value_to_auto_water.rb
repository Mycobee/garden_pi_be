class AddDefaultValueToAutoWater < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
        :gardens,
        :auto_water,
        false 
    )
  end
end

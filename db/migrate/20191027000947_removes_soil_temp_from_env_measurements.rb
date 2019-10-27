class RemovesSoilTempFromEnvMeasurements < ActiveRecord::Migration[5.2]
  def change
    remove_column :env_measurements, :soil_temperature
  end
end

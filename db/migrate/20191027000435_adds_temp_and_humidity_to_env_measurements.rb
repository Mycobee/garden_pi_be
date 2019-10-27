class AddsTempAndHumidityToEnvMeasurements < ActiveRecord::Migration[5.2]
  def change
    add_column :env_measurements, :temperature, :float
    add_column :env_measurements, :humidity, :float
  end
end

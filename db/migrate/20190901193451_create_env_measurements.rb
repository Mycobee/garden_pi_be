class CreateEnvMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :env_measurements do |t|
      t.float :soil_temperature
      t.float :soil_moisture

      t.timestamps
    end
  end
end

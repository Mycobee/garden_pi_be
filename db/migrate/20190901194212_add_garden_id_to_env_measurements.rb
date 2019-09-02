class AddGardenIdToEnvMeasurements < ActiveRecord::Migration[5.2]
  def change
		add_reference :env_measurements, :garden, index: true
  end
end

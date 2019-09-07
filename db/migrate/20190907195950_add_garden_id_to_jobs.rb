class AddGardenIdToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :garden, index: true
  end
end

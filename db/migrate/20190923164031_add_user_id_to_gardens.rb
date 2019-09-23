class AddUserIdToGardens < ActiveRecord::Migration[5.2]
  def change
  	add_reference :gardens, :user, index: true
  end
end

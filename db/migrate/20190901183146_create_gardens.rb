class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :name
      t.decimal :latitute
      t.decimal :longitude

      t.timestamps
    end
  end
end

class CreateFanGears < ActiveRecord::Migration
  def change
    create_table :fan_gears do |t|
      t.integer :team_id

      t.timestamps
    end
  end
end

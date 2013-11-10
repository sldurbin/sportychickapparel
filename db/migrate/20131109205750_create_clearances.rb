class CreateClearances < ActiveRecord::Migration
  def change
    create_table :clearances do |t|

      t.timestamps
    end
  end
end

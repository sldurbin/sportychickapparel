class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name

      t.timestamps
    end
  end
end

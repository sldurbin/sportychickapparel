class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :link
      t.text :image
      t.decimal :price
      t.text :description
      t.integer :apparel_id
      t.integer :shoe_id
      t.integer :brand_id
      t.integer :sport_id
      t.integer :clearance_id
      t.integer :team_id

      t.timestamps
    end
  end
end

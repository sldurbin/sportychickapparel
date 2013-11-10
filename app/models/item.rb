class Item < ActiveRecord::Base
  belongs_to :apparel
  belongs_to :shoe
  belongs_to :brand
  belongs_to :sport
  belongs_to :team
  belongs_to :clearance
end

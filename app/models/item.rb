class Item < ActiveRecord::Base
  belongs_to :apparel
  belongs_to :shoe
  belongs_to :brand
  belongs_to :sport
  belongs_to :team
  belongs_to :clearance

  after_destroy :destroy_associations

  self.per_page = 12

  def destroy_associations
    self.apparel.destroy if !self.apparel.nil? and self.apparel.items.count == 0
    self.shoe.destroy if !self.shoe.nil? and self.shoe.items.count == 0
    self.brand.destroy if !self.brand.nil? and self.brand.items.count == 0
    self.sport.destroy if !self.sport.nil? and self.sport.items.count == 0
    self.team.destroy if !self.team.nil? and self.team.items.count == 0
    self.clearance.destroy if !self.clearance.nil? and self.clearance.items.count == 0 
  end


end

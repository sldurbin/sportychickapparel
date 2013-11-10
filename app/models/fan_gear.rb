class FanGear < ActiveRecord::Base
  has_many :items
  belongs_to :team
end

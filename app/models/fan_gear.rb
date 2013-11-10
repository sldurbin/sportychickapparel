class FanGear < ActiveRecord::Base
  has_many :items, dependent: :destroy
  belongs_to :team
end

class Team < ActiveRecord::Base
  belongs_to :league
  has_many :fan_gears, dependent: :destroy
  validates :name, presence: true
end

class League < ActiveRecord::Base
  has_many :teams, dependent: :destroy
  validates :name, presence: true
end

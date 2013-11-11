class Team < ActiveRecord::Base
  belongs_to :league
  has_many :items, dependent: :destroy
  validates :name, presence: true

  after_destroy :destroy_associations

  def to_s
    return self.name
  end

  def destroy_associations
    self.league.destroy if !self.league.nil? and self.league.teams.count == 0
  end
end

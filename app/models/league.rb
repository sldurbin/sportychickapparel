class League < ActiveRecord::Base
  has_many :teams, dependent: :destroy
  validates :name, presence: true

  def items
    return self.teams.map{ |t| t.items }.flatten
  end

  def to_s 
    return self.name
  end
end

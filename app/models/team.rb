class Team < ActiveRecord::Base
  belongs_to :league
  has_many :items, dependent: :destroy
  validates :name, presence: true

  def to_s
    return self.name
  end
end

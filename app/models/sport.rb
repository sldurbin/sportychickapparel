class Sport < ActiveRecord::Base
  has_many :items, dependent: :destroy
  validates :name, presence: true

  def to_s
    return self.name.titleize
  end

end

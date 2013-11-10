class Brand < ActiveRecord::Base
  has_many :items
  validates :name, presence: true

  def to_s
    return self.name.titleize
  end
end

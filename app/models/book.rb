class Book < ActiveRecord::Base
  attr_accessible :authors, :cover_url, :description, :isbn, :page_count, :price, :published_on, :title
  validates_uniqueness_of :isbn
  validate :published_date_cant_be_in_the_future
  validates :price, :numericality => {:greater_than_or_equal_to => 0}
  # validates_numericality_of :price, :greater_than_or_equal_to => 0

  has_many :authorships
  has_many :authors, :through => :authorships

  def published_date_cant_be_in_the_future
    if published_on && published_on > Date.today
      errors.add(:published_on, "can't be in the future")
    end
  end
end

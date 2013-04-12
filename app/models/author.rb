class Author < ActiveRecord::Base
  attr_accessible :bio, :born_on, :name
  # has_one :book
  has_many :authorships
  has_many :books, :through => :authorships
end

require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "unique ISBN" do
    book = books(:advanced_rails)
    book2 = Book.new
    book2.isbn = book.isbn
    refute book2.save, "allowed assignment of same ISBN to two books"
  end

  test "publication date is in the past" do
    book = Book.new
    book.published_on = Time.now + 10.days
    refute book.save, "publication date is in the future"
  end

  test "price is not negative" do
    book = Book.new
    book.price = -5
    refute book.save, "price is negative"
  end

end

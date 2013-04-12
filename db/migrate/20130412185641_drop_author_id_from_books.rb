class DropAuthorIdFromBooks < ActiveRecord::Migration
  def up
    Authorship.destroy_all
    Book.all.each do |b|
      authorship = Authorship.new
      authorship.book_id = b.id
      authorship.author_id = b.author.id if b.author
      authorship.save
    end
    remove_column :books, :author_id
  end

  def down
    add_column :books, :author_id, :integer
    Authorship.all.each do |authorship|
      book = authorship.book
      book.author_id = authorship.book_id
      book.save
    end
  end
end

class ConvertAuthorToForeignKey < ActiveRecord::Migration
  def up
    add_column :books, :author_id, :integer
    Book.all.each do |book|
      author = Author.new
      author.name = book.author
      author.save
      book.author_id = author.id
      book.save
    end
    remove_column :books, :author
  end
end

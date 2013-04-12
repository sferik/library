class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :cover_url
      t.integer :isbn
      t.integer :page_count
      t.string :author
      t.string :title
      t.integer :price
      t.date :published_on
      t.text :description

      t.timestamps
    end
  end
end

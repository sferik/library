class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.date :born_on
      t.text :bio

      t.timestamps
    end
  end
end

class CreateReferences < ActiveRecord::Migration[6.0]
  def change
    create_table :references do |t|
      t.string :book_name
      t.integer :chapter_no
      t.integer :verse_no

      t.timestamps
    end
  end
end

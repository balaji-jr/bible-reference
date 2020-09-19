class CreateVerses < ActiveRecord::Migration[6.0]
  def change
    create_table :verses do |t|
      t.text :verse
      t.references :reference, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSerieSets < ActiveRecord::Migration[7.0]
  def change
    create_table :serie_sets, id: :uuid do |t|
      t.string :name
      t.date :release_date
      t.references :serie, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

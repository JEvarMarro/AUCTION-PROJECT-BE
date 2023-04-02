class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards, id: :uuid do |t|
      t.integer :number
      t.string :name
      t.references :card_type, null: false, foreign_key: true, type: :uuid
      t.references :card_rarity, null: false, foreign_key: true, type: :uuid
      t.references :serie, null: false, foreign_key: true, type: :uuid
      t.references :serie_set, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :card, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :collections, [:user_id, :card_id], unique: true
  end
end

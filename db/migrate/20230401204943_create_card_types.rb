class CreateCardTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :card_types, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end

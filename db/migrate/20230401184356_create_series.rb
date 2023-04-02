class CreateSeries < ActiveRecord::Migration[7.0]
  def change
    create_table :series, id: :uuid do |t|
      t.string :name
      t.date :release_date
      t.timestamps
    end
  end
end

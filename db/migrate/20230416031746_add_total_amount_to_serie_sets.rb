class AddTotalAmountToSerieSets < ActiveRecord::Migration[7.0]
  def change
    add_column :serie_sets, :total_amount, :integer, null: false, default: 0
  end
end

class AddComparisonTableCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :comparison_tables_count, :integer
  end
end

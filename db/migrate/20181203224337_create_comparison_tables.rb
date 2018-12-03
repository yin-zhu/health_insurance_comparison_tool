class CreateComparisonTables < ActiveRecord::Migration[5.1]
  def change
    create_table :comparison_tables do |t|
      t.integer :estimated_spend
      t.integer :user_id
      t.integer :insurance_plan_id

      t.timestamps
    end
  end
end

class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|

      t.timestamps
    end
  end
end

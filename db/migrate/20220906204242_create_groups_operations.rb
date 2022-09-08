class CreateGroupsOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_operations do |t|
      t.bigint :group_id
      t.bigint :operation_id

      t.timestamps
    end
  end
end

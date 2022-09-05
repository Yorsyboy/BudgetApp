class AddAuthorIdToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :author_id, :bigint
  end
end

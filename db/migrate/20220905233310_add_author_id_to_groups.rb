class AddAuthorIdToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :author_id, :bigint
  end
end

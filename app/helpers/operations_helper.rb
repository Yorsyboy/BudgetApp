module OperationsHelper
  def find_operations 
    operations = []
    groups_operations = GroupsOperation.where(group_id: params[:group_id]).order(created_at: :desc)
    groups_operations.each do |groups_operation|
      operations << Operation.find(id: groups_operation.operation_id)
    end
    operations
  end

  def create_groups_operations(operation, array)
    i = 1

    while i <= array.length
        group = Group.find(id: array[i])
        operation.groups << group
        i += 1
    end
end
end
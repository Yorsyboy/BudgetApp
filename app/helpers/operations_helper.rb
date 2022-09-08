module OperationsHelper
  def find_operations
    if params[:group_id]
      Group.find(params[:group_id]).operations
    else
      Operation.all
    end
  end

  def create_groups_operations(operation, array)
    i = 1

    while i < array.length
      group = Group.find_by(id: array[i])
      operation.groups << group
      i += 1
    end
  end
end

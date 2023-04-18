class TodoList
  def initialize
    @list = []
  end
  
  def add(todo)
    fail "This task is not a string" unless todo.is_a?(String)
    @list << todo
  end
  
  def todos
    @list
  end
end
  
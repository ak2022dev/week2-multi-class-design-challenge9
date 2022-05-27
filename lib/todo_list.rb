class TodoList

  def initialize
    @list = [] 
  end

  def add(task)
    #task is a Task
    @list << task
  end

  def list_all
    @list
  end

end

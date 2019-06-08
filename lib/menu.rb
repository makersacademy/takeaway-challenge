class Menu

  def initialize(list)
    @list = list
  end

  def list
    result = @list.map { |dish| dish.description } 
    result.join(", ")
  end

end

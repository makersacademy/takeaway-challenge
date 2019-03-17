class Takeaway
  
  attr_reader :dishes

  def initialize
    @dishes = { "rice": 1.25, "banana": 1.00, "fries": 2.10 }
  end

  def show_list
    @dishes
  end

end

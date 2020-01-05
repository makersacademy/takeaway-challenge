class Dishes

  attr_reader :dishes
  
  def initialize
    @dishes = { :pizza => 13, :noodles => 7, :meat => 9, :salad => 6 }
  end
end

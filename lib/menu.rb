class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end


  def list_dishes
    @dishes.collect do |name , price|
      "#{name.capitalize.to_s}: £#{"%.2f" % price}"
    end.join(", ")
  end
end

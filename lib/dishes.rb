class Dishes
  attr_reader :name, :price, :available, :list_available_dishes

  def initialize(name = "", price = 1, available = true)
    @name = name
    @price = price
    @available = available
    @available_dishes = {}
  end

  def available?(availability)
    if availability == "yes"
      @available = true
    elsif availability == "no"
      @available = false
    else
      @available
    end
  end

  def list_available_dishes
    p @available_dishes = {:@name => @price} if available?("yes")
    p @available_dishes
  end
end
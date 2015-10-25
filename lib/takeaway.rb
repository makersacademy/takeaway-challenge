class Takeaway

  def initialize(dishes)
    @dishes = dishes
  end

  def list_dishes
    list = ""
    @dishes.each_with_index do |dish, index|
      num, name, price = (index + 1).to_s, dish.name, dish.price.to_s
      line = num.ljust(10) + name.ljust(20) + price.rjust(6) + "\n"
      list << line
    end
    list
  end

end

class LookUp
  def initialize(list)
    @list = list
  end
  def by_name(string)
    search_name = string.tr(" ","_").to_sym
    @list.each { |dish| return dish if dish.name == search_name }
    raise "Dish not on menu!"
  end
  def by_number(number)
    raise TypeError unless number.is_a?(Integer)
    return @list[number-1]
  end
  def dish_number(dish)
    raise("Dish doesn't exist") unless @list.include?(dish)
    return (@list.index(dish) + 1)
  end
end

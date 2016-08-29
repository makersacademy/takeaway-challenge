class Menu

attr_reader :list

  def initialize
    @list = {Margerita: 5,
            Napolitan: 7,
            Pepperoni: 9}
  end

  def show_list
    puts "Pizza options are "
    list.each {|item,price| puts "#{item}: £#{price}"}
  end

  def price(item)
    fail "Not on the menu" if !list.include?(item.to_sym)
    list[item.to_sym]
  end

end

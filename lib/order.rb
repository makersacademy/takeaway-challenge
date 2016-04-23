class Order
  attr_reader :basket, :menu, :person

  def initialize(menu = Menu.new, person = Person.new)
    @menu = menu
    @person = person
    @basket = {}
  end

  def add(*args)
    args_number = args.length
    return menu.dishes[args[0]] unless menu.contains?(args[0])  # I need the contains?(key) method in Menu class
    fix_msg = " added to your basket."
    if args_number == 1
      message = "1 x #{args}" + fix_msg
    elsif args_number == 2
      raise "error not a number" unless arg[1].is_a?(Fixnum)
      message = "#{args[1]} x #{args[0]}" + fix_msg
    elsif args number == 3
      raise "error not the correct sum" unless arg[2] == self.total   # again I need to workout the total
      message = "#{args[1]} x #{args[0]}" + fix_msg + "Order placed, thank you"
    end
    message

    dish = args[0]
    quantity = args[1]
  end
end
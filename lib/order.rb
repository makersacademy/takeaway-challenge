class Order

require_relative 'menu'

attr_reader :cart

  def initialize(menu)
    @menu = menu.menu
    @cart = []
  end

  def add(choice)
    @cart << @menu.select { |item, price| item == choice  }
  end

  def total
    count = 0
    @cart.each do |hash|
      hash.each do |item, price|
        count += price
      end
    end
    count
  end

  def summary
    summary_string = ""
    @cart.each do |choice|
      choice.each do |item, price|
        summary_string << "#{item} . . . . . £#{price} \n"
     end
   end
    summary_string
  end
end

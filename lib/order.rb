class Order

  attr_reader :basket, :choice, :quantity, :text

  def initialize(menu)
    @basket = Hash.new(0)
    @menu = menu
  end

  def add(choice, quantity = 1)
    @choice, @quantity = choice, quantity
    raise "Item not on menu" unless @menu.include?(@choice)
    @quantity.times do
      @basket[choice] += 1
    end
    puts "#{@quantity} x #{@choice} added to basket"
  end

  def basket_summary
    @running_total = 0
    @basket.each do |dish, quantity|
      sub_total = @menu[dish] * quantity
      @running_total += sub_total
      puts "#{quantity} x #{dish} - £#{sprintf('%.2f', sub_total)}"
    end
  end

  def total
    @total = 0
    @basket.each do |dish, quantity|
      @total += @menu[dish] * quantity
    end
    @total
  end

  def check_totals
    raise "Totals do not match" if @running_total != @total
    print_total
  end

  def print_total
    puts "Total £" + sprintf('%.2f', @total)
  end

end

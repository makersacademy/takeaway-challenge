class Order
  attr_reader :menu, :basket, :total

  def initialize(menu_class:)
    @menu = menu_class
    @basket = []
    @total = 0
  end

  def list_menu
    menu.items.each do |item|
      puts "#{item[:dish]} - #{item[:price]}"
    end
  end

  def choose(meal, how_many = 1)
    @menu.items.each do |item|
      next if !item.has_value?(meal)
      raise "You can't have a selected dish go into the negatives" if (item[:selected] += how_many) < 0

      item[:selected] + how_many if item.has_value?(meal)
    end
    add_to_basket
  end

  def total_price
    @basket.each do |item|
      @total += item[:price] * item[:selected]
    end
    puts "#{total}"
  end

  private

  def add_to_basket
    @menu.items.each do |item|
      next if item[:selected] == 0
      @basket << item
    end
  end

end
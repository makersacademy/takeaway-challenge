require_relative 'takeaway'

class Basket

  attr_reader :basket

  def initialize(menu)
    @basket = []
    @menu = menu
  end

  def view
    "Your basket total is #{basket_total} and it contains:\n#{basket_list}"
  end

  def add(item, price = @menu.read[item], quantity = get_quantity(item))
    @basket << hash(item, price, quantity)
  end

  private

  def hash(item, price, quantity)
    { :name => item, :price => price, :quantity => quantity }
  end

  def get_quantity(item)
    quantity = 1
    quantity += @basket[get_index(item)][:quantity] unless new_item(item)
    quantity
  end

  def get_index(item)
    @basket.index { |line| line[:name] == item }
  end

  def new_item(item)
    is_new = true
    @basket.each { |line| is_new = false if line[:name] == item }
    is_new
  end

  def basket_total
    @basket.map { |line| line[:price] * line[:quantity] }.sum.round(2)
  end

  def basket_list
    @basket.map { |line| compose_line(line) }.join("\n")
  end

  def compose_line(line)
    "#{line[:quantity]} x #{line[:name]} for #{line[:price]} each"
  end

end

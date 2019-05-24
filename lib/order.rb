class Order
  attr_reader :items

  def initialize(menu = Menu)
    @items = []
    @menu = menu.new
  end

  def add(name, amount)
    price = get_the_cost_from_menu(name)
    full_item = { :name => name, :price => price, :amount => amount }
    items.push(full_item)
  end

  def show
    puts "You are ordering:"
    @items.each { |item|
      puts "#{item[:name]} for £#{item[:price]} x #{item[:amount]}"
    }
  end

  def cost
    cost = 0
    @items.each { |full_item|
      cost += full_item[:price] * full_item[:amount]
    }
    cost
  end

  private 
  def get_the_cost_from_menu(name)
    @menu.cost_of(name)
  end
end

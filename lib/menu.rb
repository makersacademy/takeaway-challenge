class Menu

  attr_reader :list, :basket

  def initialize
    @list = {
      "Apple" => 1,
      "Banana" => 2,
      "Mango" => 3,
      "Peach" => 4,
      "Pear" => 5
      }
    @basket = []
  end

  def view_menu
    @list
  end

  def select(food, quantity)
    @list.each do |item, cost|
      if food == item
        quantity.times { @basket << { item => cost } }
      end
    end
  end

  def basket_total
    counts = Hash.new(0)
    @basket.each do |unit|
      unit.each do |item, cost|
        counts[unit] += 1
      end
    end
    counts.each do |unit, quantity|
      unit.each do |item, cost|
        return "#{item} x #{quantity} = £#{(quantity * cost)}"
      end
    end
  end
end

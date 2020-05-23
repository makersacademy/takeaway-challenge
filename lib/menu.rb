
class Menu

  def initialize
    @menu = [Item.new("name1", '£1.00'),
             Item.new("name2", '£1.50')]
  end

  def show_dishes
    @menu.each do |item|
      puts "#{item.name}: #{item.price}"
    end
  end

  def check(poss_item)
    @menu.each { |item| return true if poss_item == item.name }
    false
  end

end

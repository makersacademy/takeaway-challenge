
class Menu

  def initialize
    @menu = [{name: 'name1', price: '£1.00'},
             {name: 'name2', price: '£1.50'}]
  end

  def show_dishes
    @menu.each do |item|
      puts "#{item[:name]}: #{item[:price]}"
    end
  end

  def check(poss_item)
    @menu.each { |item| return true if poss_item == item[:name] }
    false
  end

end

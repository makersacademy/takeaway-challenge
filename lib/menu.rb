
class Dishes

  def initialize
    @menu = [{name: 'name1', price: '£1.00'},
             {name: 'name2', price: '£1.50'}]
  end

  def show_dishes
    @menu.each do |item|
      puts "#{item[:name]}: #{item[:price]}"
    end
  end

end

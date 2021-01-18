require_relative 'menuitem'

class Basket

  def initialize
    @basket = []
    @sum = 0
  end

  def add(item)
    item = MenuItem.new(item)
    @basket.push(item)
    @sum += item.price.to_f
    puts "Item added to basket!"
  end

  def remove(index)
    @sum -= @basket[index].price.to_f
    @basket.delete_at(index)
    puts "Item removed from basket."
  end

  def print
    print_array = []

    @basket.each do |item|
      item = {
        :name => item.name,
        :description => item.description,
        :price => item.price,
        :category => item.category
      }
      print_array.push(item)
    end

    print_array.insert(-1, { :description => "total", :price => @sum })
  end

  def total
    total = 0
    @basket.each { |item| total += item.price.to_f }
    return total
  end

end

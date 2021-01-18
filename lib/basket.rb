require_relative 'menu_item'

class Basket

  def initialize
    @basket = []
    @sum = 0
  end

  def add(item)
    menu_item = Menu_Item.new(item)
    @basket.push(menu_item)
    @sum += menu_item.price.to_f
  end

  def remove(index)
    @sum -= @basket[index].price.to_f
    @basket.delete_at(index)
  end

  def print
    print_array = [{:name=>"Basket", :description=>"title"}]

    @basket.each do |item|
      item = {
        :name=>item.name,
        :description=>item.description,
        :price=>item.price,
        :category=>item.category
      }
      print_array.push(item)
    end

    print_array.insert(-1, {:name=>"Total:", :description=>"total", :price=>@sum})
  end

end

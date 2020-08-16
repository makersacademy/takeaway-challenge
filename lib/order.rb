class Order

  def initialize 
    @menu = @menu = {
      "Sushi set" => 12,
      "Prawn katsu curry" => 9,
      "Kitsune udon" => 7,
      "Onigiri" => 3,
      "Matcha ice-cream" => 4
    }
    @total = 0
    @order = []
  end

  def print_menu
    @menu.each { |key, value| puts " #{key}: £#{value}" }
  end

  def user_order(food)
    # puts "Please enter the names of the items you would like to order.\nPlease type 'done' when you've finished."
      if @menu.include?(food) == true
         @order.push(food)
         print @order
      elsif food == 'done'
        return order_total
      elsif @menu.include?(food) == false
        puts "Item not on menu"
        return
      end
  end

  def current_order
    print @order
  end

  def order_total
    @order.each do |item|
      price = @menu.fetch(item)
      @total += price
    end
    return @total
  end
end

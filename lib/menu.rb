class Menu

  attr_accessor :list_menu, :selected_items

  def initialize
    @list_menu = {
      1 => { :dish => "pasta", :price => 2.10 }, 
      2 => { :dish => "toast", :price => 2.50 },
      3 => { :dish => "pizza", :price => 2.80 },
      4 => { :dish => "fries", :price => 3.00 }
    }
    @selected_items = []
    
  end

  def add_item(num_arr)
    # @selected_items = @list_menu.values.select{ |items| items[:dish]==:pasta }
    num_arr.each do |item| @selected_items << @list_menu[item]
    end
    @selected_items
  end

  def check_total
    sum = 0
    total = @selected_items.map{|x| sum += x[:price]}
    sum
  end

  def confirm_order
    "Thank you! Your order was placed and will be delivered before 18:52"
  end

end
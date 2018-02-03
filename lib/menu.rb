class Menu

  attr_reader :options

  def initialize
    @options =   {
        :prawn_crackers => 1.95,
        :prawn_summer_roll => 4.95,
        :vegetable_spring_rolls => 3.95,
        :tom_yam_soup => 4.95,
        :green_curry => 6.95,
        :pad_thai => 6.95,
        :steamed_rice => 2.25
        }
  end

  def print_order_verification(order)
    print_quantities(order)
    print_total_cost(order)
  end

  private

  def print_quantities(order)
    order_quantities = calculate_quantities(order)
    order_quantities.each do |item,quantity|
      puts "#{quantity} x #{item}(s)"
    end
  end

  def calculate_quantities(order)
    order_quantities = Hash.new(0)
    order.each do |order|
      order_quantities[order] += 1
    end
    order_quantities
  end

  def print_total_cost(order)
    total_cost = calculate_total(order)
    puts "Total cost: £#{total_cost}"
  end

  def calculate_total(order)
    total_cost = 0
    order.each do |item|
      total_cost += @options[item.gsub(/\s+/, "_").downcase.to_sym]
    end
    total_cost.floor(2)
  end

end

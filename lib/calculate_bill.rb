require_relative 'confirmation'
require_relative 'menu'

class CalculateBill

  attr_reader :customer_order, :total_value, :confirmation, :menu

  def initialize(customer_order)
    @customer_order = customer_order
    @total_value = 0
  end

  def calculate_total
    calculate_starters
    calculate_mains
    print_confirmation
   end

  def print_confirmation
    create_confirmation
    @confirmation.prints
  end

  def calculate_starters
    create_menu
    int = 0
    until int == @customer_order.count
      @menu.starters_list.each do |hash|
        if hash.include?(@customer_order[int])
          dish_value = hash[@customer_order[int]].to_f
          @total_value += dish_value
        end
      end
      int += 1
    end
    '%.2f' % @total_value
  end

  def calculate_mains
    create_menu
    int = 0
    until int == @customer_order.count
      @menu.main_course_list.each do |hash|
        if hash.include?(@customer_order[int])
          dish_value = hash[@customer_order[int]].to_f
          @total_value += dish_value
        end
      end
      int += 1
    end
    '%.2f' % @total_value
  end

  private

  def create_menu
    @menu = Menu.new
  end

  def create_confirmation
    @confirmation = Confirmation.new(@customer_order, '%.2f' % @total_value)
  end

end


class Order
    attr_reader :users_order

    def initialize(menu)
      @users_order = Hash.new
      @menu = menu
      @total = 0
    end

    def user_choice(dish, quantity)
      raise 'choice not found' if @menu.dishes[dish] == nil
      @users_order[dish] = quantity
      puts "You ordered #{dish} x#{quantity}"
      puts total_order(dish,quantity)
    end

    def total_order(dish,quantity)
      @total +=  (@menu.dishes[dish] * quantity)
      "Your total order is currently £%.2f" % [@total]
    end

end
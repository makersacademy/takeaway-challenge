
class Order
    attr_reader :users_order

    def initialize(menu)
      @users_order = Hash.new
      @menu = menu
    end

    def user_choice(dish, quantity)
      raise 'choice not found' if @menu.dishes[dish] == nil
      @users_order[dish] = quantity
    end
end
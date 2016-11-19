require_relative "menu"

class Order


  def initialize(menu_klass)
    @menu = menu_klass.new
    @added_dishes = []
  end

  def menu
    @menu.dishes
  end

  def add(dish,number)
    raise "The dish is not on the menu." unless menu.include?(dish.to_sym)
    @added_dishes << [dish,number]
  end

  def total
    total = 0
    @added_dishes.each do |element|
      total += element[1] * menu[element[0].to_sym]
    end
    total
  end

  private
    def reset_order
      @added_dishes = []
    end




end



# def order(*args, total)
#   total_value = 0
#   string = ""
#   args.each_slice(2) do |name,number|
#     menu.each do |dish|
#        if dish.include?(name.to_sym)
#          total_value += dish[name.to_sym] * number
#          string << "#{number} dish(es) of #{name} "
#        end
#     end
#   end
#   total_value
#   raise "Incorrect total value." if total != total_value
#   "You ordered " + string
# end

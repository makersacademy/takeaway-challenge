require_relative 'order'

class Takeaway

  attr_reader :menu

  def initialize(order = Order.new)
    @menu = { Margarita: 6.50, Moscow_Mule: 7.15, Gin_and_tonic: 6.00,
              Mojito: 6.79, Daiquiri: 8.21, Old_fashioned: 7.46,
              Bloody_Mary: 6.10, Cosmopolitan: 8.00, Negroni: 6.50,
              Caipirinha: 9, Piña_Colada: 7.60, Gimlet: 6.15,
              Sex_on_the_Beach: 9, White_Russian: 7.80, Aperol_Spritz: 7 }
    @order = order
  end

  def print_menu
    print_logo
    @menu.each { |key, value| puts "#{key}: ".rjust(45) + "£%.2f" % "#{value}".ljust(10) }
    puts
  end

  def order(item, amount)
    raise "Item unavailable" unless item_check(item)
    @order.order(item.capitalize, amount)
  end

  def basket
    @order.basket
  end

  def checkout(amount)
    @order.checkout(amount)
  end

private

  def item_check(item)
    @menu.has_key?(item.capitalize.to_sym)
  end

  def print_logo
    puts '     ______           __   __        _ __   __        __                                   __ '.ljust(100)
    puts '   / ____/___  _____/ /__/ /_____ _(_) /  / /_____ _/ /_____  ____ __      ______ ___  __/ /  '.ljust(100)
    puts '  / /   / __ \/ ___/ //_/ __/ __ `/ / /  / __/ __ `/ //_/ _ \/ __ `/ | /| / / __ `/ / / / /   '.ljust(100)
    puts ' / /___/ /_/ / /__/ ,< / /_/ /_/ / / /  / /_/ /_/ / ,< /  __/ /_/ /| |/ |/ / /_/ / /_/ /_/    '.ljust(100)
    puts ' \____/\____/\___/_/|_|\__/\__,_/_/_/   \__/\__,_/_/|_|\___/\__,_/ |__/|__/\__,_/\__, (_)     '.ljust(100)
    puts '                                                                                /____/        '.ljust(100)
  end
end

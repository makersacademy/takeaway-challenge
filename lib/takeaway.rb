require_relative 'order'

class Takeaway

  attr_reader :menu

  def initialize(order = Order.new)
    @menu = { margarita: 6.50, moscow_mule: 7.15, gin_and_tonic: 6.00,
              mojito: 6.79, daiquiri: 8.21, old_fashioned: 7.46,
              bloody_mary: 6.10, cosmopolitan: 8.00, negroni: 6.50,
              caipirinha: 9, pina_colada: 7.60, gimlet: 6.15,
              sex_on_the_beach: 9, white_russian: 7.80, aperol_spritz: 7 }
    @order = order
    @total = 0
  end

  def print_menu
    print_logo
    @menu.each { |key, value| puts "#{key}: ".rjust(45) + "£%.2f" % "#{value}".ljust(10) }
    puts
  end

  def order(item, amount)
    raise "Item unavailable" unless item_check(item)
    @order.order(menu_format(item), amount)
    puts "Total value in basket: £#{calculate_total}"
  end

  def basket
    raise "Basket is empty!" if @order.basket.empty?
    puts "Total value in basket: £#{calculate_total}"
    @order.basket
  end

  def checkout(amount)
    raise "Incorrect total" unless amount == @total.round(2)
    @order.checkout(amount)
  end

private

  def calculate_total
    return 0 if @order.basket.empty?
    @total = 0
    @order.basket.each { |item| @total += @menu[item.to_sym] }
    @total.round(2)
  end

  def item_check(item)
    @menu.has_key?menu_format(item).to_sym
  end

  def menu_format(string)
    string.downcase.gsub(/[ ]/, '_')
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

require_relative 'menu'

class MenuDisplay
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu.menu
  end

  def list_menu
    list = []
    menu.each { |key, value|
      next_line = [print_item(key), price_to_sterling(value)].join(': ')
      list.push(next_line)
    }
    list.join("\n")
  end

  def price_to_sterling(num)
    '£' + num.to_s
  end

  def print_item(item)
    item.to_s.split('_').each{ |item| item.capitalize! }.join(' ')
  end

end

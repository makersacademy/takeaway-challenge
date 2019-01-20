require_relative 'menu'

class MenuDisplay

  def list_menu(hash:)
    list = []
    hash.each { |key, value|
      next_line = [print_item(key), price_to_sterling(value)].join(': ')
      list.push(next_line)
    }
    list.join("\n")
  end

  def price_to_sterling(num)
    '£' + num.to_s
  end

  def print_item(item)
    item.to_s.split('_').each { |it| it.capitalize! }.join(' ')
  end

end

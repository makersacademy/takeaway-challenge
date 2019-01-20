class MenuDisplay

  def list_menu(hash:)
    list = []
    hash.each_with_index { |key_value_pair, index|
      numerator = '#' + (index + 1).to_s + '.'
      next_line = [numerator, print_item(key_value_pair[0]), price_to_sterling(key_value_pair[1])].join(' ')
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

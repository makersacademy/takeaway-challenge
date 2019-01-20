class MenuDisplay

  def list_menu(hash:)
    list = []
    hash.each_with_index { |kv, index|
      num = '#' + (index + 1).to_s + '.'
      next_line = [num, print_item(kv[0]), price_to_sterling(kv[1])].join(' ')
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

module Item_printer

  def ordered_print(items)
    items.each_with_index do |item, ind|
      puts template_generator(item, ind)
    end
  end

  private

  def template_generator(item,ind)
    if item[:summary]
      "#{ ind + 1 }. #{ item[:category].capitalize } - #{ item[:summary].capitalize }"
    else
      "#{ ind + 1 }. #{ item[:item].capitalize }, £#{ '%.2f' % item[:price].round(2) } - #{ item[:description].capitalize }"
    end
  end

end

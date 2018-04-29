module ItemPrinter

  def ordered_print(items)
    items.each_with_index do |item, ind|
      puts template_generator(item, ind)
    end
  end

  private

  def template_generator(item, ind)
    if item.is_a?(Hash)
      "#{ind + 1}. #{item[:category].capitalize} - #{item[:summary].capitalize}"
    else
      "#{ind + 1}. #{item.name.capitalize}, £#{'%.2f' % item.price.round(2)}\
       - #{item.description.capitalize}"
    end
  end

end

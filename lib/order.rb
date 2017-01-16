require_relative 'menu'

module Order

  def format_item(item)
    item = item.upcase
    fail "Item not on menu" unless menu_list.include? item
    {item => menu_list[item]}
  end

  def format_basket
    basket.each do |addeditem|
      addeditem.each do |item, price|
        puts "#{item} = £#{format('%.02f', (price.to_f / 100))}"
      end
    end
  end

end

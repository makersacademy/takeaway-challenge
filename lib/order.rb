require_relative 'menu'

module Order

  def add_to_order(item)
    item = item.upcase
    fail "Item not on menu" unless menu_list.include? item
    {item => read_menu[item]}
  end

  def format_basket
    basket.each do |addeditem|
      addeditem.each do |item, price|
        puts "#{item} = £#{format('%.02f', (price.to_f / 100))}"
      end
    end
  end

  def calculate_total
    basket.each {|x| x.each {|_key, value| @total += value}}
    "Total: £#{format('%.02f', (@total.to_f / 100))}"
  end

end

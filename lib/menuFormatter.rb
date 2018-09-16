class MenuFormatter

  def format(menu)
    # puts "Item, Price"
    menu.each do |menuitem|
      puts "#{menuitem[:item]}, #{menuitem[:price]}"
    end
  end
end

module Menu


  def menu_list
    dishes = {
      "DELUXE KEBAB"=>799,
      "CHICKEN KEBAB"=>450,
      "SHISH KEBAB"=>400,
      "PIZZA"=>500,
      "CHIPS"=>250,
      "CHEESY CHIPS"=>299,
      "COLESLAW"=>99,
      "BBQ BEANS"=>99
    }
  end

  def read_menu
    menu_list.each do |item, price|
      puts "#{item} = £#{format('%.02f', (price.to_f / 100))}"
    end
  end


end

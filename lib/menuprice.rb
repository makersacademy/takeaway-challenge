require 'csv'

module MenuPrice

  def price(dish_name,filename = "menu_list")
      CSV.foreach("/Users/peterbarcsak/Projects/takeaway-challenge/lib/#{filename}.csv") do |line|
      dish, price = line
      return price.to_f if dish.to_sym == dish_name
    end
  end

end

class Menu

attr_reader :item_list

  def initialize
    @item_list = [{item: "Pizza", price: 5},
                 {item: "Burger", price: 2},
                 {item: "Kebab", price: 3}
    ]
  end

  def show_menu
    puts "  Dish -- Price"
    @item_list.each_with_index do |item, index|
      puts "#{index + 1} #{item[:item]} -- £#{item[:price]}"
    end
  end

end

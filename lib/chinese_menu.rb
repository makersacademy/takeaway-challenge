class ChineseMenu
  def initialize
    @dishes = [{ name: "Dandan Noodles", price: 3 },
              { name: "Liang Pi", price: 3 },
              { name: "Baozi", price: 5 },
              { name: "Chilli Tofu", price: 5 },
              { name: "Stir Fried Pork", price: 6.5 },
              { name: "Satay Chicken", price: 7 },
              { name: "Peking Duck", price: 45 },
              { name: "Gold Peking Duck", price: 1500 }
    ]
    @title = "* * * STREET * CHINESE * * *\n"
  end

  def list_dishes
    @title + formatted_list.join
  end

  private

  def formatted_list
    @dishes.map.with_index do |dish, index|
      "#{index + 1}) #{dish[:name]}: £#{sprintf('%.2f', dish[:price])}\n"
    end
  end
end

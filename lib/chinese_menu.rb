class ChineseMenu
  def initialize
    @dishes = [{ "Dandan Noodles" => 3 },
              { "Liang Pi" => 3 },
              { "Baozi" => 5 },
              { "Chilli Tofu" => 5 },
              { "Stir Fried Pork" => 6.5 },
              { "Satay Chicken" => 7 },
              { "Peking Duck" => 45 },
              { "Gold Peking Duck" => 1500 }
    ]
    @title = "* * * STREET * CHINESE * * *\n"
  end

  def list_dishes
    @title + formatted_list.join
  end

  def dishes
    @dishes.dup
  end

  private

  def formatted_list
    @dishes.map.with_index do |dish, index|
      "#{index + 1}) #{dish.keys.first}: " \
      "£#{sprintf('%.2f', dish.values.first)}\n"
    end
  end
end

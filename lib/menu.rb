class Menu

  def initialize
    @items = [
      {"number" => 1, "name" => "Chicken Korma", "cost" => 9.99},
      {"number" => 2, "name" => "Chicken Katsu", "cost" => 7.49},
      {"number" => 3, "name" => "Lamb Biriyani", "cost" => 6.99},
      {"number" => 4, "name" => "Chicken Kofta", "cost" => 10.99},
      {"number" => 5, "name" => "Lamb Bhuna", "cost" => 8.89},
      {"number" => 6, "name" => "Beef Fahl", "cost" => 7.99},
      {"number" => 7, "name" => "Duck Jalfrezi", "cost" => 8.99}
    ]
  end

  def display_menu
    @items.each {|item| puts "#{item["number"]}. #{item["name"]} #{item["cost"]}"}
  end 

  def select_item(number, quantity)
    @items.each do |item|
      if item["number"].to_s == number
        return [item, quantity]
      end
    end
  end 
end

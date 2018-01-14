class Menu

  DISHES = [
    {name: "Spring rolls", price: 5.50},
    {name: "Korean Hot wings", price: 5.50},
    {name: "Prawn crackers", price: 2.00},
    {name: "Chicken katsu curry", price: 9.50},
    {name: "Malaysian coconut curry", price: 6.95},
    {name: "Sweet and sour tofu", price: 6.95},
    {name: "Chow mein", price: 7.95}
  ]

  def to_s
    DISHES.map {|item| "#{item[:name]}, £%.2f" % item[:price]}.join("\n")
  end

  def price(item)
    DISHES.find{|dish| dish[:name] == item}[:price]
  end

end
class Menu

  ITEMS = {
    "burger" => {
      name: "burger",
      price: 10.00
    },
    "cheese burger" => {
      name: "cheese burger",
      price: 11.00
    },
    "chicken burger" => {
      name: "chicken burger",
      price: 11.00
    },
    "sietan burger" => {
      name: "seitan burger",
      price: 12.50
    },
    "fries" => {
      name: "fries",
      price: 4.00
    },
    "chunky chips" => {
      name: "chunky chips",
      price: 4.50
    },
    "coleslaw" => {
      name: "coleslaw",
      price: 3.00
    },
    "chicken wings" => {
      name: "chicken wings",
      price: 6.50
    },
    "cola" => {
      name: "cola",
      price: 2.50
    },
    "fanta" => {
      name: "fanta",
      price: 2.50
    },
  }

  def view
    puts formatted_menu
  end

  private

  def formatted_menu
    items = ITEMS.map do |_, item_details|
      "#{item_details[:name]} #{item_details[:price]}\n"
    end
    items.join(" ")
  end

end

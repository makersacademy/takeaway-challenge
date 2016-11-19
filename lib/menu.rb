class Menu

  def welcome
    "Welcome to Dan's Mexican Resturaunt.\n We are a brand new resturaunt and appreciate your business!\n"
  end

  def list_menu
    menu = [ {number: 1, name: "Burrito", price: 6}, {number: 2, name: "Quesadilla", price: 4}, {number: 3, name: "Tacos", price: 5}, {number: 4, name: "Taquitos", price: 6}, { number: 5, name: "Corn", price: 2} ]

       menu.collect do |item|
        p "Item Number: #{item[:number]}      #{item[:name]}      £#{item[:price]}"
     end
  end

end

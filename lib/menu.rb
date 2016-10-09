class Menu

attr_reader :dishes

def initialize
  @dishes = [{dish: 1, name: "kebab", price: 3},
             {dish: 2, name: "burger", price: 4},
             {dish: 3, name: "fries", price: 2},
             {dish: 4, name: "shake", price: 2.5}
  ]
end

def view_menu
  @dishes.each{|dish| puts "#{dish[:dish]}: #{dish[:name]} -- £#{dish[:price]}"}
end


end

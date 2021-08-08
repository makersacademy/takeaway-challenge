class Menu

attr_reader :menu, :menu2

def initialize
  @menu = [
  { item: 'Korma', price: 10.00 },
  { item: 'Katsu', price: 14.00 },
  { item: 'Salad', price: 9.00 },
  { item: 'Prawns', price: 2.50 }
  ]
end

def print_menu
  @menu.each.with_index(1) do |subhash, index|
    puts "#{index}. #{subhash[:item]}, #{subhash[:price]}"
end
end

end
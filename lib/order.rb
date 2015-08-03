menu = {
  "Pizza" => 10.99,
  "Prawns" => 2.99,
  "Mussels" => 2.00,
  "Wings" => 5.00,
  "Salmon" => 8.00
    }


def show(menu)
  menu.each do |item, price|
    puts "#{item}: $#{price}"
  end
end

show(menu)

puts "what would you like?"

request = gets.chomp.capitalize!

def valid?(request)
  menu.any? {|item, price| item.include? request}
end

# if request valid add item and price to new hash order

request



order = {}

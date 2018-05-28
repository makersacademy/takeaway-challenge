require_relative 'restaurant'

nickys = Restaurant.new({ Margarita: 6, Americano: 8, Hawaiian: 7 })
puts ["                            _________",
"              r==           |       |",
"           _  //            |  N.P. |   ))))",
"          |_)//(''''':      |       |",
"            //  \\_____:_____.-------D     )))))",
"           //   | ===  |   /        \\",
"       .:'//.   \\ \\=|   \\ /  .:'':./    )))))",
"      :' // ':   \\ \\ ''..'--:'-.. ':",
"      '. '' .'    \\:.....:--'.-'' .'",
"       ':..:'                ':..:'                  "]

puts "\nWELCOME TO NICKY'S PIZZERIA!!!!"

loop do
  inp = ""
  loop do
    puts "Type M to see the menu, P to place an order"
    inp = gets.chomp
    break if inp == "M"
    break if inp == "P"
  end
  nickys.print_menu if inp == "M"
  puts "Time to place your order. Press return after each dish."
  order = []
  loop do
    dish = gets.chomp
    break if dish == ""
    order << dish
  end
  nickys.place_order(*order)
  puts "Press C to confirm"
  inp2 = gets.chomp
  if inp2 == "C"
    nickys.send_sms
    break
  else
  end
end

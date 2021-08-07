require 'takeaway'

describe "Basic feature test" do

  puts "Creates new takeaway object: #{takeaway = Takeaway.new}"
  puts "Shows menu: #{takeaway.menu}"
  puts "Shows current order: #{takeaway.current_order}"
  puts "Adds dish: #{takeaway.add("Hot Dog")}"
  puts "Shows current order: #{takeaway.current_order}"
  puts "Adds unavailable dish: #{takeaway.add("Gruel")}"
  puts "Shows current order: #{takeaway.current_order}"
  puts "Adds another dish: #{takeaway.add("Hot Dog")}"
  puts "Shows current order: #{takeaway.current_order}"

end

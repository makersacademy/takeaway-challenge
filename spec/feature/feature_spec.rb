require 'fooderoo'

describe 'takeaway app' do
  fooderoo = Fooderoo.new
  fooderoo.show_menu
  fooderoo.select 'Pizza Diavola', 2
  fooderoo.select 'Tagliatelle with duck ragu', 8
  # puts fooderoo.check_order 92 ### Uncommenting this line will send text messages...
end

require 'menu'

describe 'takeaway app' do
  menu = Menu.new
  menu.select 'Pizza Diavola', 2
  menu.select 'Tagliatelle with duck ragu', 8
  puts menu.check_order 92
end

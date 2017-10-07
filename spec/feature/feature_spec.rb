require 'menu'

describe 'takeaway app' do
  menu = Menu.new
  menu.select 'Pizza Diavola', 2
  menu.select 'Tagliatelle with duck ragu', 1
  p menu.selection
end

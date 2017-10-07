require 'menu'

describe 'takeaway app' do
  menu = Menu.new
  menu.select 'Pizza Diavola'
  menu.select 'Tagliatelle with duck ragu'
  p menu.selection
end

require './item.rb'
require './menu.rb'
require './basket.rb'

arr = [
  [2,'pepsi','drink'],
  [2,'fanta','drink'],
  [1,'prawn crackers','side'],
  [5,'lemon chicken','main'],
  [5,'sweet and sour pork','main'],
  [5,'singapore noodles','side'],
  [5,'cashew and yellow bean chicken','main'],
  [3,'egg fried rice','side'],
  [2,'plain rice','side'],
  [3,'satay chicken','side'],
  [3,'spring rolls','side'],
  [3,'bbq ribs','side'],
  [6,'schezuan king prawns','main'],
  [5,'black bean beef','main']
]

MENU = Menu.new

arr.each do |item|
  MENU.put(Item.new(item[0],item[1],item[2]))
end

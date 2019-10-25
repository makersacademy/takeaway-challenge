class Dish
attr_reader: dishes_list
 
MENU = [
  {name: 'Pizza Margarita', price: '£11.99'},
   {name: 'Pizza Mighty Meaty', price: '£16.99'},
    {name: 'Pizza Hawaiian', price: '£14.99'},
    {name: 'Potato Wedges', price: '£5.99'},
    {name: 'Ice-cream Ben&Jerry', price: '£3.99'},
    {name: 'Coke', price: '£2.99'},
    {name: 'Pepsi', price: '£2.99'}
]
def initialize(dishes = MENU)
@dishes_list = dishes
end

end


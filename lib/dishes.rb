class Dishes

attr_reader :list

def initialize(list = list)
  @list = [{dish: 'Hawaiian' , price: '8.99'},
    {dish: 'BBQ Original', price: '6.99'},
    {dish: 'Vegeterian', price: '7.99'},
    {dish: 'Four Seasons', price: '5.99'},
    {dish: 'Seafood' , price: '8.99'},
    {dish: 'Margerita' , price: '4.99'},
    {dish: 'Ceasar Salad' , price: '5.90'}
   ]
 end

end

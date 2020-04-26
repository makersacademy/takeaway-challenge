require 'order'
require 'menu'
require 'dish'

context Order do
  # TODO: refactor to use double for dish_number
  
  describe '#add' do
    it { is_expected.to respond_to(:add).with(2).argument }
    
    it 'raises error if not passed an Integer' do
      menu = Menu.new
      dish_1 = Dish.new(1, 2.00, "Plain rice")
      dish_2 = Dish.new(2, 3.00, "Special rice")
      dish_3 = Dish.new(3, 113.00, "Very Special rice")
      dish_4 = Dish.new(4, 0.01, "Unspecial rice")
      
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)

      expect { subject.add("Plain rice", menu) }.to raise_error Order::ERROR_NOT_INTEGER
    end
    
#     TODO: Find out why this test doesn't work
#     it 'raises error if order_number not on menu' do
#       menu = Menu.new
#       dish_1 = Dish.new(1, 2.00, "Plain rice")
#       dish_2 = Dish.new(2, 3.00, "Special rice")
#       dish_3 = Dish.new(3, 113.00, "Very Special rice")
#       dish_4 = Dish.new(4, 0.01, "Unspecial rice")
#       
#       menu.add(dish_1)
#       menu.add(dish_2)
#       menu.add(dish_3)
#       
#       expect { subject.add(1, menu) }.to raise_error Menu::ERROR_DISH_NOT_EXISTS
#     end
    
    it 'returns number on success' do
      menu = Menu.new
      dish_1 = Dish.new(1, 2.00, "Plain rice")
      dish_2 = Dish.new(2, 3.00, "Special rice")
      dish_3 = Dish.new(3, 113.00, "Very Special rice")
      dish_4 = Dish.new(4, 0.01, "Unspecial rice")
      
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      
      expect(subject.add(1, menu)).to eq 1
    end
    
  end
  
  describe '#order' do
    it { is_expected.to respond_to(:order) }
    
    it 'returns Array containing order' do
      menu = Menu.new
      dish_1 = Dish.new(1, 2.00, "Plain rice")
      dish_2 = Dish.new(2, 3.00, "Special rice")
      dish_3 = Dish.new(3, 113.00, "Very Special rice")
      dish_4 = Dish.new(4, 0.01, "Unspecial rice")
      
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      numbers = Array.new
      numbers.push(1)
      numbers.push(2)
      subject.add(1, menu)
      subject.add(2, menu)
      expect(subject.order).to eq numbers
    end
    
  end

end

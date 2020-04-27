require 'order'
require 'menu'
require 'dish'

context Order do
  # TODO: refactor to use double for dish_number

  let(:dish_number) { Integer.new }
  let(:dish_price) { Float.new }
  let(:dish_name) { String.new }

  before(:each) do
    @menu = Menu.new
    @dish = Dish.new(:dish_number, :dish_price, :dish_name)
    @dish_1 = Dish.new(1, :dish_price, :dish_name)
    @dish_2 = Dish.new(2, :dish_price, :dish_name)
    @menu.add(@dish_1)
    @menu.add(@dish_2)
  end

  describe '#add' do
    
    it 'raises error if not passed an Integer' do
      expect { subject.add("Plain rice", @menu) }.to raise_error Order::ERROR_NOT_INTEGER
    end
    
    it 'raises error if order_number not on menu' do
      expect { subject.add(3, @menu) }.to raise_error Menu::ERROR_DISH_NOT_EXISTS
    end
    
    it 'returns number on success' do
      expect(subject.add(1, @menu)).to eq 1
    end
    
  end
  
  describe '#order' do
    
    it 'returns Array containing order' do
      numbers = Array.new
      numbers.push(1)
      numbers.push(2)
      subject.add(1, @menu)
      subject.add(2, @menu)
      expect(subject.order).to eq numbers
    end
    
  end
  
  describe '#total' do
    
    it 'returns 0 if no items have been added' do
      expect(subject.total(@menu)).to eq 0
    end
    
    it 'returns order amount if items have been added' do
      price_3 = 1.00
      price_4 = 2.00
#       total_price = price_3 + price_4
      dish_3 = Dish.new(3, price_3, :dish_name)
      dish_4 = Dish.new(4, price_4, :dish_name)
      @menu.add(dish_3)
      @menu.add(dish_4)
      subject.add(3, @menu)
      subject.add(4, @menu)
      expect(subject.total(@menu)).to eq price_3 + price_4
    end
    
  end
  
  describe '#time' do
    
    it 'returns time order was last updated' do
      expect(subject.time).to be_an_instance_of(Time)
    end
  end

end

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
    it { is_expected.to respond_to(:add).with(2).argument }
    
    it 'raises error if not passed an Integer' do
      expect { subject.add("Plain rice", @menu) }.to raise_error Order::ERROR_NOT_INTEGER
    end
    
#     TODO: Find out why this test doesn't work
#     it 'raises error if order_number not on menu' do
#       expect { subject.add(1, @menu) }.to raise_error Menu::ERROR_DISH_NOT_EXISTS
#     end
    
    it 'returns number on success' do
      expect(subject.add(1, @menu)).to eq 1
    end
    
  end
  
  describe '#order' do
    it { is_expected.to respond_to(:order) }
    
    it 'returns Array containing order' do
      numbers = Array.new
      numbers.push(1)
      numbers.push(2)
      subject.add(1, @menu)
      subject.add(2, @menu)
      expect(subject.order).to eq numbers
    end
    
  end

end

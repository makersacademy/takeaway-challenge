require 'menu'
require 'dish'

context Menu do
  let(:dish_number) { Integer.new }
  let(:dish_price) { Float.new }
  let(:dish_name) { String.new }

  before(:each) do
    @dish = Dish.new(:dish_number, :dish_price, :dish_name)
    @dish_1 = Dish.new(1, :dish_price, :dish_name)
    @dish_2 = Dish.new(2, :dish_price, :dish_name)
  end
  
  describe '#add' do

    it 'returns dish added on success' do
      expect(subject.add(@dish)).to eq @dish
    end
    
    it 'raises error if dish number is not unique' do
      subject.add(Dish.new(1, :dish_price, :dish_name))
      expect { subject.add(Dish.new(1, :dish_price, :dish_name)) }.to raise_error Menu::ERROR_DISH_EXISTS
    end
    
  end
  
  describe '#get' do
    
    it 'raises error if dish is not on the menu' do
      expect { subject.get(2) }.to raise_error Menu::ERROR_DISH_NOT_EXISTS
    end
    
    it 'returns dish corresponding the number' do
      subject.add(@dish_1)
      expect(subject.get(1)).to eq @dish_1
    end
  
  end
  
  describe '#dishes' do
    
    it 'returns array of dishes' do
      dishes = Array.new
      dishes.push(@dish_1)
      dishes.push(@dish_2)
      subject.add(@dish_1)
      subject.add(@dish_2)
      expect(subject.dishes).to eq dishes
    end
  
  end

#   TODO: remove check private method
#   describe '#contains?' do
#   
#     it { is_expected.to respond_to(:contains?).with(1).argument }
#     
#     it 'returns false if dish is not on menu' do 
#       expect(subject.contains?(@dish)).to eq false
#     end
#     
#     it 'return true if dish is on menu' do
#       dish_1 = Dish.new(1, :dish_price, :dish_name)
#       subject.add(dish_1)
#       expect(subject.contains?(dish_1)).to eq true
#     end
#     
#   end
  
end

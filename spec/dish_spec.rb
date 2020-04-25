require 'dish'

context Dish do

  describe '.new' do
    it 'takes three arguments' do
      expect(Dish).to respond_to(:new).with(3).arguments
    end
  end
  
  describe '.number returns dish number' do
    number = 2
    dish = Dish.new(number, 2.00, "Plain rice")
    it 'returns dish number when asked' do
      expect(dish.number).to eq number
    end
  end

end

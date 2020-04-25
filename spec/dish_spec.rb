require 'dish'

context Dish do

  describe '.new' do
    it 'takes three arguments' do
      expect(Dish).to respond_to(:new).with(3).arguments
    end
  end
  
  describe '.number returns dish number' do
    dish = Dish.new(1, 2.00, "Plain rice")
    it 'returns dish number when asked' do
      expect(dish.number).to eq 1
    end
  end

end

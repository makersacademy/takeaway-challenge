require 'dish'

context Dish do
  let(:dish_number) { Integer.new }

  describe '.new' do
    it 'takes three arguments' do
      expect(Dish).to respond_to(:new).with(3).arguments
    end
  end
  
  describe '.number returns dish number' do
    dish = Dish.new(:dish_number, 2.00, "Plain rice")
    it 'returns dish number when asked' do
      expect(dish.number).to eq :dish_number
    end
  end

  describe '.price returns dish price' do
    dish = Dish.new(:dish_number, 2.00, "Plain rice")
    it 'returns dish price when asked' do
      expect(dish.price).to eq 2.00
    end
  end

end

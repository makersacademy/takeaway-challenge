require 'dish'

context Dish do
  let(:dish_number) { Integer.new }
  let(:dish_price) { Float.new }
  let(:dish_name) { String.new }

  before(:each) do
    @dish = Dish.new(:dish_number, :dish_price, :dish_name)
  end
  
  describe '.new' do
    it 'takes three arguments' do
      expect(Dish).to respond_to(:new).with(3).arguments
    end
  end
  
  describe '.number returns dish number' do
#     dish = Dish.new(:dish_number, :dish_price, :dish_name)
    it 'returns dish number when asked' do
      expect(@dish.number).to eq :dish_number
    end
  end

  describe '.price returns dish price' do
#     dish = Dish.new(:dish_number, :dish_price, :dish_name)
    it 'returns dish price when asked' do
      expect(@dish.price).to eq :dish_price
    end
  end

  describe '.name returns dish name' do
#     dish = Dish.new(:dish_number, :dish_price, :dish_name)
    it 'returns dish price when asked' do
      expect(@dish.name).to eq :dish_name
    end
  end

end

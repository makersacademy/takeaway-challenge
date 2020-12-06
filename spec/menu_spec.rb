require 'menu'

describe Menu do
  let(:dish_double) { double :dish, name: "Poridge", price: 1 }
  let(:dish_class_double) { double :dish_class, new: dish_double }
  let(:menu) { described_class.new(dish_class_double) }

  describe '#new' do
    it 'should create an instance' do
      expect(menu).to be_instance_of described_class
    end
  end

  describe '#see' do
    it 'should return an empty array' do
      expect(menu.see).to eq []
    end
  end

  describe '#add_dish' do
    it 'should respond with two arguments given' do
      expect(menu).to respond_to(:add_dish).with(2).arguments
    end

    it 'should add a dish to menu' do
      menu.add_dish(dish_double.name, dish_double.price)
      expect(menu.see).to eq [dish_double]
    end
  end
end

require './lib/dish_printer'

describe DishPrinter do

  let(:dish) { double(:dish, name: 'Test Dish 1', description: 'Test dish 1 description', price: 10.95) }

  context '#to_string' do
    it { is_expected.to respond_to(:to_string).with(2).arguments }

    it 'includes index' do
      expect(described_class.to_string(dish, 0)).to match(/^0\./)
    end

    it 'includes name' do
      expect(described_class.to_string(dish, 0)).to match(/Test Dish 1/)
    end

    it 'includes description' do
      expect(described_class.to_string(dish, 0)).to match(/Test dish 1 description/)
    end

    it 'includes price' do
      expect(described_class.to_summary(dish, 0)).to match(/10.95/)
    end

    it 'should return a custom formatted string' do
      p described_class.to_string(dish, 0)
      expect(described_class.to_string(dish, 0)).to eq "0. #{dish.name}   #{dish.description}      #{dish.price}"
    end
  end

  context '#to_summary' do
    it { is_expected.to respond_to(:to_summary).with(2).arguments }

    it 'includes index' do
      expect(described_class.to_summary(dish, 0)).to match(/^0\./)
    end

    it 'includes name' do
      expect(described_class.to_summary(dish, 0)).to match(/Test Dish 1/)
    end

    it 'includes price' do
      expect(described_class.to_summary(dish, 0)).to match(/10.95/)
    end

    it 'should return a custom formatted string' do
      p described_class.to_summary(dish, 0)
      expect(described_class.to_summary(dish, 0)).to eq "0. #{dish.name}      #{dish.price}"
    end
  end
end

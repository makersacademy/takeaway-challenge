require './lib/dish.rb'

describe Dish do

  subject(:dish) { described_class.new(name: 'Test Dish 1', description: 'Test description.', price: 10.95) }

  describe 'initialization' do
    it 'creates a Dish with a name, description, and price' do
      expect(subject).to be_an_instance_of Dish
    end

    it { is_expected.to respond_to(:name) }

    it { is_expected.to respond_to(:description) }

    it { is_expected.to respond_to(:price) }

  end

  context '#summary_s' do
    it { is_expected.to respond_to(:summary_s) }

    it 'should return a custom summary string' do
      p dish.summary_s
      expect(dish.summary_s).to eq "#{dish.name}           #{dish.price}"
    end
  end

  context '#to_s' do

    it { is_expected.to respond_to(:to_s) }

    it 'should return a custom formatted string' do
      p dish.to_s
      expect(dish.to_s).to eq "#{dish.name}     #{dish.description}           #{dish.price}"
    end
  end
end

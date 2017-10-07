require './lib/dish.rb'

describe Dish do

  subject(:dish) { described_class.new('Test Dish 1', 10.95) }

  it { is_expected.to respond_to(:to_s) }

  it { is_expected.to respond_to(:name) }

  it { is_expected.to respond_to(:price) }

  context '#to_s' do
    it 'should return a custom formatted string' do
      p dish.to_s
      expect(dish.to_s).to eq "#{dish.name}                #{dish.price}"
    end
  end
end

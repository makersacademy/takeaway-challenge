require './lib/dish.rb'

describe Dish do

  subject(:dish) { described_class.new(name: 'Test Dish 1', description: 'Test description.', price: 10.95) }

  it { is_expected.to respond_to(:to_s) }

  it { is_expected.to respond_to(:summary_s) }

  it { is_expected.to respond_to(:name) }

  it { is_expected.to respond_to(:description) }

  it { is_expected.to respond_to(:price) }

  context '#summary_s' do
    it 'should return a custom summary string' do
      p dish.summary_s
      expect(dish.summary_s).to eq "#{dish.name}           #{dish.price}"
    end
  end

  context '#to_s' do
    it 'should return a custom formatted string' do
      p dish.to_s
      expect(dish.to_s).to eq "#{dish.name}     #{dish.description}           #{dish.price}"
    end
  end
end

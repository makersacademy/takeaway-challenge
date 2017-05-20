require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  it { is_expected.to respond_to(:show_menu) }

  it 'has an empty basket upon instantiation' do
    expect(restaurant.basket).to eq({})
  end

  describe '#show_menu' do
    it 'prints out the items on the menu with prices' do
      expect(restaurant.show_menu).to eq ({"quarter chicken": 3.5, "half chicken": 6.0, "whole chicken": 10.50, "small fries": 1.99, "large fries": 2.50})
    end
  end
end

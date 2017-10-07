require 'dishes.rb'

describe Dishes do
  subject(:dishes) {described_class.new}

  describe 'menu list' do
    let(:dish) do
      { "curry" => 1.00,
      "xcurry" => 1.00 }
    end

    it 'will show the menu list' do
      expect(dishes.list).to include(dish)
    end
  end
end

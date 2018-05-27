require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  it 'responds to #menu' do
    expect(restaurant).to respond_to(:menu)
  end

  describe '#menu' do
    it 'prints a list of dishes and prices' do
      restaurant.menu= {Chicken: 2}
      expect { restaurant.menu }.to output("Chicken: £2\n").to_stdout
    end
  end
end

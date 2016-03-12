require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'should respond to add_to_basket method' do
    expect(order).to respond_to(:add_to_basket).with(2).arguments
  end

  describe '#initialize' do
    it 'should initialize with a basket hash' do
      expect(order.basket).to be_a Hash
    end

    it 'should initialize the basket to be empty' do
      expect(order.basket).to be_empty
    end
  end

  # describe '#add_to_basket' do
  #   it 'should add the selection from the takaway class to the basket' do
  #
  #   end
  # end

end

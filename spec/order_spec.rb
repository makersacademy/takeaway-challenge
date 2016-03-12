require 'order'

describe Order do
  subject(:order) { described_class.new }

  describe '#initialize' do
    it 'has an empty basket' do
      expect(order.basket).to be_empty
    end
  end

  # describe '#add_to_basket' do
  #   it 'should add menu item to basket' do
  #     expect
  #   end
  # end
end

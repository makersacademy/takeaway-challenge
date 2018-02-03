require 'cafe'

describe Cafe do
  subject(:cafe) { described_class.new }

  describe '#print_menu'
  it 'displays a menu of available items' do
    expect(cafe.print_menu).to eq Cafe::MENU
  end

  describe '#add'
  context 'when passed an item argument' do
    it 'stores selected items in the basket' do
      expect { cafe.add("Buckwheat Shamalam") }.to change { cafe.basket }.to(["Buckwheat Shamalam"])
    end
  end

  describe '#price'
  context 'when basket is not empty'
  it 'returns the total payment due' do
    expect(cafe.price).to eq(cafe.price)
  end
end

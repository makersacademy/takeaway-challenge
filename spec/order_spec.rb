require 'order'

describe Order do

  let(:pizza) {double(:item, name: 'pizza', price: 10)}
  let(:pasta) {double(:item, name: 'pasta', price: 5)}
  let(:menu) {double(:menu, items: [pizza, pasta])}
  let(:restaurant) {double(:restaurant, menu: menu)}
  subject {described_class.new(restaurant)}


  describe 'it has a working basket' do
    before do
      allow(menu).to receive(:select_by_name).with('pasta').and_return(pasta)
      subject.add_item('pasta', 3)
    end
    it 'can place items into a basket' do
      expect(subject.basket[pasta]).to eq 3
    end

    it 'can remove items from the basket' do
      subject.remove_item('pasta', 1)
      expect(subject.basket[pasta]).to eq 2
    end

    it 'can check items in basket' do
      expect(subject.check_basket).to eq subject.basket
    end
  end

  describe '#checkout' do
    before do
      allow(menu).to receive(:select_by_name).with('pasta').and_return(pasta)
      subject.add_item('pasta', 3)
    end
    it 'can calculate the total in basket and confirm' do
      expect(restaurant).to receive(:confirm_order).with(15)
      subject.checkout(15)
    end

    it 'can raise an error if total is incorrect' do
      expect{subject.checkout(85)}.to raise_error 'you put the wrong total in!'
    end
  end

end

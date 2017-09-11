require 'order'
require 'takeaway'
describe Order do
  describe '#view_basket' do
    context 'basket empty' do
      it 'empty' do
        expect(subject.basket).to eq({})
      end
    end
    context 'contain an item' do
      it 'show item' do
        subject.add_to_basket('Proscuiutto Pizza')
        expect(subject.basket).to eq({ "Proscuiutto Pizza" => 1 })
      end
    end
  end
  describe '#add_basket' do
    it 'is method and take 2 arguments' do
      is_expected.to respond_to(:add_to_basket).with(2).argument
    end
  end
  describe '#calc_total' do
    context 'empty_basket' do
      it 'return 0' do
        takeaway = Takeaway.new
        menu = takeaway.read
        expect(subject.calc_total(menu)).to eq 0
      end
    end
    context 'items in basket' do
      it 'return total' do
        takeaway = Takeaway.new
        menu = takeaway.read
        subject.add_to_basket('Proscuiutto Pizza')
        expect(subject.calc_total(menu)).to eq 13.50
      end
    end
  end
end

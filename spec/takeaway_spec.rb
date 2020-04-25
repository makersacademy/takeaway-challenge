require 'takeaway'

describe TakeAway do
  menu = [{id: "1", name: "Kdebap", price: 1.00}]
  subject(:takeaway) { described_class.new(menu) }

  it 'initializing menu' do
    expect(takeaway.menu).to be menu
  end

  describe ' #get_menu' do
      it 'shows menu' do
        allow(menu).to receive(:generator).and_return menu
        expect(takeaway.get_menu).to be menu
      end
    end

   describe ' #select_dish' do
      it 'select dish' do
        allow(menu).to receive(:list).and_return menu
         takeaway.select(1)
        expect(takeaway.basket).to eq menu
      end
    end
end

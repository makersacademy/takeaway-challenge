require 'takeaway'

describe Takeaway do

  context 'with menu double' do
    let(:menu_double) { double :menu }
    let(:subject) { Takeaway.new(menu_double) }

    it 'gets a menu' do 

      allow(menu_double).to receive(:display_menu) { { curry: 1.99 } }
      expect(subject.show_menu).to eq({ curry: 1.99 })
    end

  end

  context 'adding items' do
    let(:menu_double) { double(:menu, menu: { curry: 9.99 }) }
    let(:basket_double) { double :basket }
    let(:subject) { Takeaway.new(menu_double, basket_double) }

    it 'returns error if given item not on menu' do
      expect { subject.add_to_order('fish', 1) }.to raise_error(RuntimeError, "Item not on menu!")
    end

    it 'does not return error if item on menu' do
      expect { subject.add_to_order("curry", 1) }.not_to raise_error("Item not on menu!")
    end

    it 'calls set_basket on Basket' do
      allow(basket_double).to receive(:set_basket) { true }
      expect(subject.add_to_order("curry", 1)).to eq true
    end

  end

  context 'showing basket and total' do
    let(:subject) { Takeaway.new }

    it 'shows basket with total' do
      subject.add_to_order('curry', 2)
      expect { subject.show_order }.to output("Order Basket:\n2x curry = £19.98\nTotal: £19.98\n").to_stdout
    end
  end

end

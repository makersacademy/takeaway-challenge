require 'takeaway'
require 'basket'

describe Takeaway do

  context 'with menu double' do
    let(:menu_double) { double :menu }
    let(:subject) { Takeaway.new(menu_double) }

    it 'gets a menu' do 

      allow(menu_double).to receive(:display_menu) { { "curry" => 1.99 } }
      expect(subject.show_menu).to eq({ "curry" => 1.99 })
    end

  end

  context 'ordering' do
    let(:menu_double) { double(:menu, menu: { "curry" => 9.99 }) }
    let(:subjet) { Takeaway.new(menu_double) }

    it 'returns error if given item not on menu' do
      expect{ subject.add_to_order('fish', 1) }.to raise_error("Item not on menu!")
    end

  end

end

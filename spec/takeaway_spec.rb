require 'takeaway'
require 'menu'

describe Takeaway do
  let (:menu) {double :menu}

  it { expect(described_class).to be < Menu }

  describe '#initialize' do
    it 'has pulled in the menu items' do
      allow(menu).to receive(:menu_items)
      takeaway = Takeaway.new(menu)
      expect(takeaway.menu_items).to eq menu.menu_items
    end
    it 'has a current order set to nil' do
      expect(subject.current_order).to eq nil
    end
  end

end

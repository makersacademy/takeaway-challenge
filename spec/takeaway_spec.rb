require 'takeaway'
require 'menu'

describe Takeaway do
  let (:menu) {double :menu}

  describe '#initialize' do
    it 'has pulled in the menu' do
      allow(menu).to receive(:new).and_return menu
      takeaway = Takeaway.new(menu)
      expect(takeaway.menu).to eq menu
    end
    it 'has a current order set to nil' do
      expect(subject.current_order).to eq nil
    end
  end


end

require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu) }
  let(:menu_class) { double(:menu_class, new: menu) }

  describe '#initialize' do
    let(:takeaway) { Takeaway.new(menu_class) }

    it 'should initialize with a menu' do
      expect(takeaway.menu).to eq menu
    end
  end

end

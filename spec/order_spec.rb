require 'order'

describe Order do
  subject(:order){described_class.new}

  describe '#show_menu' do
    it {is_expected.to respond_to(:show_menu)}

    it 'should list availble dishes' do
      expect(order.show_menu).to be_a Hash
    end
  end
end
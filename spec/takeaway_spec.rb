require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:takeaway) { described_class.new(menu) }

  describe '#view_menu' do
    it { is_expected.to respond_to(:view_menu) }

    it 'prints the menu' do
      expect(menu).to receive(:print_menu)
      takeaway.view_menu
    end
  end

  describe '#add_item' do
    it { is_expected.to respond_to(:add_item).with(2).arguments }

    it 'adds items to order' do
      takeaway.add_item("California Rolls", 1)
      expect(takeaway.order).to include({ "California Rolls" => 1 })
    end
  end

end

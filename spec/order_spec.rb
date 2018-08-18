require 'order'

describe Order do
  let(:menu) { double :double }
  subject { described_class.new(menu) }

  describe '#see_menu' do
    it 'passes #print_menu to Menu' do
      expect(menu).to receive(:print_menu)
      subject.see_menu
    end
  end

  describe '#place_order' do
    it 'passes #check_total to Menu' do
      order_array = [[1,1], [3,1], [7,1], 12]
      expect(menu).to receive(:check_order)
      subject.place_order(order_array)
    end
  end
end

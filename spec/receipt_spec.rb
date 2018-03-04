require 'receipt'

describe Receipt do
  #let(:menu) {double('menu', :menu_list => {:pizza => 8, :cheese_burger => 7})}
  subject {described_class.new('pizza', 7,)} # add double
  describe '#print_receipt' do
    it 'returns the order and prices' do
      # expect(subject.print_receipt).to eq 'pizza - £7'
    end
  end
  describe '#print_header' do
    it 'prints a header' do
      expect(subject.print_header).to eq 'You ordered:'
    end
  end
end

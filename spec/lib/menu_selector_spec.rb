require 'menu_selector'
require 'stringio'

describe MenuSelector do
  subject(:selector) { described_class.new(menu,order) }
  let(:order) { double(:order, send_receipt: "receipt", sum_items: "1.00")}
  let(:menu) { double(:menu, list: {"test" => '2'}) }

  describe '#menu' do
    it 'it has a menu' do
      expect(selector.menu).to eq "---\ntest: '2'\n"
    end
  end

  describe '#select' do
     before(:each) do
      $stdin = StringIO.new("\rn")
     end
    it 'allows user to select from menu' do
      expect(selector.select).to eq "1.00"
    end
  end

  describe '#receipt' do
    it 'should return a receipt' do
      expect(selector.receipt).to eq "receipt"
    end
  end
end


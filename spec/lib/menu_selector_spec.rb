require 'menu_selector'

describe MenuSelector do
  subject(:selector) { described_class.new(menu,order) }
  let(:order) { double(:order, send_receipt: "receipt")}
  let(:menu) { double(:menu, list: {"test" => '2'}) }

  describe '#menu' do
    it 'it has a menu' do
      expect(selector.menu).to eq "---\ntest: '2'\n"
    end
  end

  # describe '#select' do
  #   it 'allows user to select from menu' do
  #     expect(takeaway.select).to respond_to(:chars)
  #   end
  # end

  describe '#receipt' do
    it 'should return a receipt' do
      expect(selector.receipt).to eq "receipt"
    end
  end
end


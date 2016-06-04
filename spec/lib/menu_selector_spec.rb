require 'menu_selector'

describe MenuSelector do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, list: {"test" => '2'}) }

  describe '#menu' do
    it 'it has a menu' do
      expect(takeaway.menu).to eq "---\ntest: '2'\n"
    end
  end

  describe '#select' do
    it 'allows user to select from menu' do
      expect(takeaway.select).to respond_to(:chars)
    end
  end
end


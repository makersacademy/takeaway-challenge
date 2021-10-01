require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:item) { double :item }

  describe '#add_item' do

    it "has an argument" do
      expect(menu).to respond_to(:add_item).with(1).argument
    end

    it "allows an item to be added" do
      expect(menu.add_item(item)).to eq item
    end

  end

end

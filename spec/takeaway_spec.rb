require 'takeaway'

describe Takeaway do
  context '#menu ' do
    before(:each) { @takeaway = Takeaway.new }
    let(:data1) { ["number", "item", "ingredients", "category"] }
    let(:data2) { ["number1", "item1", "ingredients1", "category1"] }
    it { is_expected.to respond_to(:menu) }

    it 'reads from a file' do
      expect(@takeaway.load_file).to eq 'File loaded!'
    end

    it 'checks menu was loaded from file' do
      expect(@takeaway.menu).to eq [["number", "item", "ingredients", "category"], ["this", "is", "a", "test"], ["to", "load", "the", "menu"]]
    end

    it 'shows items from a file' do
      expect(@takeaway.show(0)).to eq ["number", "this", "to"]
    end
  end
end

require 'basket'

RSpec.describe Basket do
  it { is_expected.to respond_to(:place_order) }

  describe "#place_order" do

    before do
      result = double
      expect(subject).to receive(:gets).and_return(result).twice
      expect(result).to receive(:chomp).and_return(:item)
      expect(result).to receive(:chomp).and_return(:quantity)
    end
    it "sets item and quantity to user's input" do
      subject.place_order
      expect(subject.instance_variable_get(:@item)).to eq :item
      expect(subject.instance_variable_get(:@quantity)).to eq :quantity
      
    end
  end
end

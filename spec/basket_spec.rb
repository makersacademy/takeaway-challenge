require 'basket'

RSpec.describe Basket do
  let(:basket) { double :basket, sum_order: {} }
  it { is_expected.to respond_to(:place_order) }
  it { is_expected.to respond_to(:sum_order) }

  it 'adds up a total' do
    allow(basket).to receive(:sum_order).and_return({})
    expect(subject.sum_order).to eq("Your total for this order is £0")
  end

  describe "#place_order" do

    before do
      result = double
      expect(subject).to receive(:gets).and_return(result).twice
      expect(result).to receive(:chomp).and_return(:item)
      expect(result).to receive(:chomp).and_return(:quantity)
    end
    it "sets item and quantity to user's input" do
      subject.place_order
      expect(subject.instance_variable_get(:@item)).to eq(:item)
      expect(subject.instance_variable_get(:@quantity)).to eq(:quantity)
      
    end
  end
end

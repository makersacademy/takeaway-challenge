require 'takeaway'

describe Takeaway do

  subject(:takeaway){ described_class.new }
  let(:aclient){ double(:Client, messages: messages) }
  let(:messages){ double(:message, create: nil) }
  let(:list) { {rice: 3, pea: 2} }
  before(:each){ allow(takeaway).to receive(:client){aclient} }

  describe '#menu' do
    it 'gives a hash of dishes and prices' do
      expect(takeaway.menu).to be_a Hash
    end
  end

  describe '#select_items' do
    it 'returns a total for the selected items' do
      expect(takeaway.select_items(list)).to eq 35
    end
  end

  describe '#place_order' do
    it 'raises an error if sum of items and total are different' do
      expect{ takeaway.place_order(list, 0) }.to raise_error("Amount given is not correct")
    end

    it 'sends the order to be texted' do
      expect(takeaway).to receive(:confirm).with(list)
      takeaway.place_order(list,35)
    end

  end


end

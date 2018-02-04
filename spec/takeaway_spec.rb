require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it 'initializes with an empty basket array' do
    expect(takeaway.basket).to eq []
  end

  it 'initializes with an empty itemised_bill array' do
    expect(takeaway.itemised_bill).to eq []
  end

  describe '#add' do
    it 'pushes user selected items into the basket array' do
      expect { takeaway.add("Buckwheat Shamalam") }.to change { takeaway.basket }.to(["Buckwheat Shamalam"])
    end
  end

  describe '#total' do
    it 'returns a total that is the sum of the itemised bill' do
      expect(takeaway.total).to eq(takeaway.total)
    end
  end

  describe '#checkout' do

    before do
      takeaway.add("Froffee Coffee")
    end

    it "sends a text message after the order is placed" do
      VCR.use_cassette('twilio') do
        takeaway.checkout
      end
    end
  end
end

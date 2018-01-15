require 'takeaway'

describe Takeaway do

  let(:fake_messenger) { double :messenger }
  subject(:takeaway) { described_class.new(messenger: fake_messenger) }

  describe '#order' do
    it 'takes order' do
      expect(takeaway.order("Lassi", 2)).to eq "Lassi * 2 added to basket"
    end
  end

  describe '#basket' do
    it 'prints dishes with prices in the basket' do
      takeaway.order("Lassi", 2)
      expect(takeaway.view_basket).to eq "Lassi * 2 = 6.0"
    end
  end

  describe '#complete_order' do
    it 'raises error if price does not match the actual amount to be paid' do
      takeaway.order("Lassi", 2)
      error = "Incorrect amount for the order"
      expect { takeaway.complete_order(5) }.to raise_error error
    end

    it 'sends message using messenger' do
      takeaway.order("Lassi", 1)
      allow(fake_messenger).to receive(:send_sms)
      takeaway.complete_order(3)
      expect(fake_messenger).to have_received(:send_sms).with starting_with("Thank")
    end

  end

  describe '#read_menu' do
    it 'displays menu with dishes and price' do
      expect(takeaway.read_menu).to include({ "Lassi" => 3.00 })
    end
  end

end

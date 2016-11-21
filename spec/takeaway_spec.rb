require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(menu, sms) }
  let(:klass1) { double(:klass1) }
  let(:klass2) { double(:klass2) }
  let(:menu) { double(:menu) }
  let(:sms) { double(:sms) }
  let(:item) { double(:item) }
  let(:qty) { double(:qty) }

  before do
    allow(menu).to receive(:new).and_return menu
    allow(sms).to receive(:new).and_return sms
    allow(menu).to receive(:menu_items).and_return ({:margherita => 6.00, :venezia => 6.70, :athena => 8.20})
    allow(sms).to receive(:send_sms)
  end

  context "Initialization" do

    it 'accepts a Menu object on initialization' do
      expect(takeaway.menu).to eq menu
    end

    it 'accepts a Message Type object on initalization' do
      expect(takeaway.message).to eq sms
    end

    it 'creates an empty order on creation' do
      expect(takeaway.order).to eq []
    end
  end

  context 'View Order' do

    it 'can let a customer review their basket' do
      takeaway.place_order(:margherita, 3)
      expect(takeaway.view_order).to eq takeaway.order
    end
  end

  context 'Confirm Order' do

    it 'returns "Incorrect Total" when passed wrong total' do
      takeaway.place_order(:venezia, 3)
      expect(takeaway.confirm_order(6)).to eq "Incorrect Total"
    end

    it 'thanks the customer for their order' do
      takeaway.place_order(:margherita, 3)
      expect(takeaway.confirm_order(18)).to eq "Thank you for your order: £18.00"
    end

  end

end

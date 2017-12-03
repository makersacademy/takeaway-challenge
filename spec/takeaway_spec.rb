require 'takeaway'

describe Takeaway do
  let(:message_sender) { double(:message_sender) }
  subject(:takeaway) { described_class.new() }

  before do
    allow(subject.msg_sender).to receive(:send_sms)
  end

  it 'should create new order objects' do
    expect(subject.order_class).to respond_to(:new)
  end

  it 'should respond to add_item with 2 args' do
    expect(subject.order).to respond_to(:add_to_order).with(2).arguments
  end

  describe '#verify_total' do
    it 'should verify a total is correct' do
      subject.add(:pizza, 1)
      expect(subject.verify_total(1.15)).to eq "Correct"
    end

    it 'should reject an incorrect total' do
      subject.add(:pizza, 1)
      expect(subject.verify_total(2.2)).to eq "Incorrect, total is: 1.15"
    end
  end

  it 'should successfully checkout' do
    subject.add(:pizza, 1)
    expect { subject.checkout("+447580011698") }.to change{ subject.order_history.length }.by 1
  end

  it 'should be able to cancel orders' do
    subject.add(:pizza, 1)
    subject.cancel_order
    expect(subject.order.items.length).to eq 0
  end
end

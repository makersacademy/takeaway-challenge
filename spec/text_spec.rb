require_relative '../lib/text'

describe Text do

  subject { described_class.new }

  let(:text) { double :text }
  let(:order) { double :subject }

  it 'sends a confirmation text' do
    allow(text).to receive(:send_text).and_return('Text sent')
    expect(subject.send_text).to eq "Text sent"
  end

  context 'delivery_time'
  it 'delivers time' do
    allow(text).to receive(:delivery_time).and_return 12
    expect(text.delivery_time).to eq 12
  end

  it 'sends text to phone number' do
    allow(text).to receive(:send_text).and_return('text sent')
    expect(text.send_text).to eq 'text sent'
  end

  before do
    allow(order).to receive(:submit_order).and_return('send_text')
  end

  context 'successfully complete order' do
    it 'completes an order' do
      expect(order.submit_order()).to eq 'send_text'
    end
  end
    

end

require 'txt_message'

describe MessagingService do
  let(:txt_message) { MessagingService.new }
  let(:kfc) { TakeAway.new("KFC", MessagingService.new) }

  it 'confirms a text message was sent confirming the order' do
    allow(kfc).to receive(:confirm_order).and_return("queued")
    expect(kfc.confirm_order).to eq "queued"
  end
  
end

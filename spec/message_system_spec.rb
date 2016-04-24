require 'message_system'

describe MessageSystem do
  subject(:message_system) {described_class.new}
  let(:one_hour_time) {(Time.now + 60*60).localtime.strftime("%H:%M")}
  let(:message) {"Thank you!"\
  "Your order was placed and will be delivered before #{one_hour_time}"}

  it 'confirms order will be delivered with a text message' do
    allow(message_system).to receive(:send_message)
    expect(message_system.send).to eq message
  end

end

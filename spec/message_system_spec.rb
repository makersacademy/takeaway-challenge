require 'message_system'

describe MessageSystem do
  subject(:message_system) {described_class.new}
  let(:one_hour_time) {(Time.now + 60*60).localtime.strftime("%H:%M")}
  let(:message) {"Thank you!"\
  " Your order was placed and will be delivered before #{one_hour_time}"}

  it 'confirms order will be delivered with a text message' do
    stub_const("MessageSystem::ACCOUNT_SID", 'AC77308b2f08a6730c203b04f2b5e64d70')
    stub_const("MessageSystem::FROM", '+15005550006')
    stub_const("MessageSystem::AUTH_TOKEN", '8871a5c37938ca13b17b561635a1d7ca')
    expect(message_system.send).to eq message
  end

end

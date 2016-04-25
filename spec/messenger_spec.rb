require 'messenger'
describe Messenger do
  subject(:messenger) {described_class.new}
  let(:time_hour) {(hour = Time.now + 60*60).localtime.strftime("%H:%M")}
  let(:body) do
    "Thankyou, we have received your order, it will be delived at #{time_hour}"
  end
  it 'sends message to confirm order' do
    stub_const('Messenger::ACCOUNT_SID',"ACd876ef2e031b1244ad45dbdd3b450231")
    stub_const('Messenger::FROM',"+441143031281")
    stub_const('Messenger::AUTH_TOKEN',"b52119878d1bc77173d4aa85117f77f3")
    expect(messenger.send).to eq body
  end

end

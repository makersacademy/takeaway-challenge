require 'sms'

describe SMS do

  subject(:sms) {described_class.new(client: client)}
  let(:client) {double(:client)}
  let(:messages) {double(:messages)}
  it 'delivers an SMS' do
    message = (
    from: '+441163263088',
    to: '+447400230230',
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
    sms.deliver
    expect(messages).to receive(:create).with(message)
  end
end

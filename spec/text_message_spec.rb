require 'text_message'
describe SMS do
  subject(:sms) { described_class.new(client: client) }

  let(:client) { double(:client) }

  it 'delivers an sms with an estimated time' do
    expect(sms.deliver).to eq("message")
  end

end

require 'messenger'

describe Messenger do
  let(:client) {double :client}
  let(:text_message) {double :text_message}
  subject {described_class.new(client)}
  
  it{is_expected.to respond_to(:confirm)}

  it 'should send a confirmation text' do
    expect(client).to receive(:create).and_return(text_message)
    subject.confirm
  end
end

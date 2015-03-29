require 'send_text'

context 'Text delivery confirmation' do
  let(:messageklass) { MessageKlass.new }
  let(:twilio) { double :twilio }

  it 'fails if there is no customer number given and order to deliver' do
    expect { messageklass.send_text }.to raise_error
  end

  xit 'succeeds otherwise' do
    twilio.stub_chain("account.messages.create")
    Twilio::REST::Client.stub(:new).and_return(twilio)
    expect(messageklass.send_text '1234', "Message").not_to raise_error
  end
end

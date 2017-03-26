require 'confirmation_text'
require_relative '../private_details.rb'

describe ConfirmationText do
  subject(:confirmation_text){described_class.new(client: client)}

  let(:client) {double(:client, messages: messages)}
  let(:messages) {double(:messages)}

  it 'sends a confirmation text with an estimated delivery time' do
    details = Details.new
    allow(Time).to receive(:now).and_return(Time.parse("16:40"))
    info = details.info.merge!(:body => "Thank you, you're order has been placed! Expected delivery time is: 17:40") 
    expect(messages).to receive(:create).with(info)
    confirmation_text.send_text
  end
end

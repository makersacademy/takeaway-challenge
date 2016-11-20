require 'text_message'

describe TextMessage do
  subject (:textmessage) {described_class.new}

  it 'should send a confirmation text once order is complete' do
    expect(textmessage).to respond_to(:send_confirmation_message)
  end

end

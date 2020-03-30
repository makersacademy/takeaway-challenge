require 'text_handler'

describe TextHandler do
  it 'sends a confirmation text to a specified phone number' do
    text_client = double(:text_client)
    allow(text_client).to receive_message_chain(:new, :messages, :create)
    expect { subject.send_confirmation_text('0123456789', text_client) }.not_to raise_error
  end

  it 'errors if the text message could not be sent' do
    text_client = double(:text_client)
    allow(text_client).to receive_message_chain(:new, :messages, :create).and_raise('Phone number invalid')
    expect { subject.send_confirmation_text('abc', text_client) }.to raise_error('unable to send text message. Error from text client - Phone number invalid')
  end
end

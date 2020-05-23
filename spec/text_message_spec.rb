require 'text_message'
require 'twilio_mock'

describe TextMessage do

  let(:message) { "Test message" }

  subject { TextMessage.new(message) }

  # mocker = TwilioMock::Mocker.new
  # attrs = {
  #   from: 'from_number',
  #   to: 'to_number',
  #   body: 'text message',
  # }
  #
  #
  #   mocker.create_message(attrs)
  #   account.messages.create(attrs)
  #
  # mocker.messages.last

end

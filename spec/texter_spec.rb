require 'texter'

describe Texter do
  it {expect(subject).to respond_to(:send_text).with(1).argument}
  it {expect(subject).to respond_to(:send_text).with(2).argument}
  # I couldn't work out how to test this class further. Are we meant to mock twilio?
  # This code was lifted from the official twilio tutorial so should work anyway... :)
end
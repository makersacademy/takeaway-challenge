require 'spec_helper'

describe Messenger do
  subject(:messenger) { described_class.new }
  it 'responds to #send_confirmation_sms' do
    expect(messenger).to respond_to :send_confirmation_sms
  end
end

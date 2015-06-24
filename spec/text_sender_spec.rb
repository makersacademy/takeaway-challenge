require 'textsender'
require 'twilio-ruby'

describe TextSender do



  it 'respond to submit text' do
    expect(subject).to respond_to(:submit_text)
  end

end

require 'text'

describe Text do
  let(:text_send_stub) {
    stub_request(:post, "https://api.twilio.com/2010-04-01/Accounts/ACeeb78433dcba23619b98cde03e52ad52/Messages.json").
         with(
           body: { "Body" => message, "From" => ENV['FROM'], "To" => ENV['TO'] },
           headers: {
          'Accept' => 'application/json',
          'Accept-Charset' => 'utf-8',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization' => 'Basic QUNlZWI3ODQzM2RjYmEyMzYxOWI5OGNkZTAzZTUyYWQ1MjphOTRkMjNkMWRkZjY4ZTcxMGZjNmE4MjNjN2U1MDM4MA==',
          'Content-Type' => 'application/x-www-form-urlencoded',
          'User-Agent' => 'twilio-ruby/5.14.1 (ruby/x86_64-darwin17 2.5.0-p0)'
           }).
         to_return(status: 200, body: "", headers: {})
  }
  let(:time) { (Time.now + described_class::HOUR).strftime("%H:%M") }
  let(:message) { "Thanks for your order! It will be delivered by #{time}." }

  describe "#send" do
    before do
      allow(subject).to receive(:create_body).and_return message
      text_send_stub
    end

    it 'should successfully send a text with a body' do
      subject.send
    end

    it 'should display a confirmation message when sent' do
      confirmation = "Thanks! Look out for a confirmation text."
      expect(subject.send).to eq confirmation
    end
  end

  describe "#create_body" do
    it 'should create a text body containing the time +1 hour' do
      expect(subject.create_body).to eq message
    end
  end
end

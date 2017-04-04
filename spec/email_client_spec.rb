require 'email_client'
include Mail::Matchers

describe EmailClient do
  subject(:client) {described_class.new}

  describe '.notify' do
    it 'responds to notify' do
      expect(client).to respond_to(:notify).with(1).argument
    end
  end



  #WARNING!!! These tests will actually send an email!!
  # describe "sending an email" do
  #
  # Mail.defaults do
  #   delivery_method :test
  # end
  #
  #   to = ["joemaidman@gmail.com"]
  #   from = ["joemaidman@gmail.com"]
  #   subject = "Test email"
  #   body = "Test body"
  #
  #   before(:each) do
  #     Mail::TestMailer.deliveries.clear
  #
  #     Mail::TestMailer.deliveries << Mail.deliver do
  #       to to
  #       from from
  #       subject subject
  #       body body
  #     end
  #   end
  #
  #   let(:email) { Mail::TestMailer.deliveries.last }
  #
  #   it 'was sent to the right email address' do
  #     expect(email.to).to eq to
  #   end
  #
  #   it 'was sent from the right email address' do
  #     expect(email.from).to eq from
  #   end
  #
  #   it 'had the correct body' do
  #     expect(email.body).to eq body
  #   end
  #
  #   it 'had the correct subject' do
  #     expect(email.subject).to eq subject
  #   end
  #
  # end

end

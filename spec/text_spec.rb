require 'text'

describe Text do
  let(:text_info) { {
    acc_sid: 'ACeeb78433dcba23619b98cde03e52ad52',
    auth_token: 'a94d23d1ddf68e710fc6a823c7e50380',
    from: '+441202286113',
    to: '+447982787204'
  } }
  let(:client) { double(:client) }
  let(:message) { "Rspec double message" }

  describe "#class constants" do
    it { expect(described_class::TEXT_INFO[:acc_sid]).to eq text_info[:acc_sid] }

    it { expect(described_class::TEXT_INFO[:auth_token]).to eq text_info[:auth_token] }

    it { expect(described_class::FROM).to eq text_info[:from] }

    it { expect(described_class::TO).to eq text_info[:to] }
  end

  # it 'should use the specified \'from\' and \'to\' values' do
  #   host = "#{text_info[:acc_sid]}, #{text_info[:auth_token]}@api.twilio.com"
  #   assert_requested(:post, "#{host}/2010-04-01/Accounts/#{text_info[:acc_sid]}/Messages.json").
  #     with(:body => {:data => {'From' => text_info[:from], 'To' => text_info[:to], 'Body' => message}})
  #   subject.send
  # end
end

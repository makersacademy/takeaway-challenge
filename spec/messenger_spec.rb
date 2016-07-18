require 'messenger'

describe Messenger do

it { is_expected.to respond_to :send_message }

end
# subject(:text) { described_class.new(codes) }
# let(:codes) { {account_sid: "chars", auth_token: "token"} }
# let(:delivery_time) { Time.now + 3600 }
# let(:body) { "Thank you! Your order will be delivered before #{ delivery_time }." }
#
#   before do
#     allow(subject).to receive(:send_message)
#   end
#
#   describe "#send_message" do
#     it 'sends a confirmation of delivery time' do
#     allow(text).to receive(:send_message).and_return(body)
#   end
# end
#
# end

# let(:account_sid) { double :account_sid}
# let(:auth_token) { double :auth_token}

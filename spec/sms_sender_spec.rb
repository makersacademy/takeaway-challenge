describe SMSSender do
  
  let(:menu) { double :menu }
  let(:order) { double :order }
  subject(:takeaway) { described_class.new(menu, order) }

  describe '#send_order_confirmation' do

  end

end

# Seb's solution:

# require 'text'

# describe Text do

#   let(:messages) { double :messages }
#   let(:account) { double :account, messages: messages }
#   let(:api) { double :api, account: account }
#   let(:client) { double :client, api: api }
#   let(:client_class) { double :client_class, new: client }

#   describe 'send'
#     it 'includes total in message body' do
#       text = described_class.new(client_class)
#       allow(messages).to receive(:create) { |args| @args = args }
#       alternative:
#       expect(messages).to recive(:create).with(an_instance_of(Hash))
#       text.send(12)
#       expect(@args[:body]).to eq "Thank you! Your order was placed. The total was: 12"
#     end

# end

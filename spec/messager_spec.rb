require 'messager'

describe Messager do
  subject(:messager) { described_class.new }

  describe '#send' do
    it 'sends confirmation message to the customer' do

    end
  end
end


# describe '#send_text' do
#     before {allow(restaurant).to receive(:send_text)}
#     it 'sends confirmation message to the customer' do
#       expect(restaurant).to receive(:send_text).with('Order confirmed, expected delivery time 20:01')
#       restaurant.complete_order
#     end
#   end




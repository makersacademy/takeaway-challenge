require 'text'
require 'order'
require 'menu'
require 'twilio-ruby'

describe Text do

  let(:order) { Order.new }
  let(:text) { described_class.new(order) }

  # context "places text message" do
  #   it "outputs delivery message" do
  #     time = "20:15"
  #     expect{ text.message }.to output("Thank you! Your order was placed and will be delivered before 20:15.").to_stdout
  #   end


    # it 'raises error if order.add_total is not correct' do
    #   expect { text.message }.to raise_error("I'm sorry, there's an error in the total. Please place your order again.")
    # end
  end

  # context "send text via Twilio" do
  #
  # end
end

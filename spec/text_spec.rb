require 'text'
require 'order'
require 'menu'
require 'twilio-ruby'
require 'date'

describe Text do

  let(:order) { Order.new }
  let(:text) { described_class.new(order) }

  context "places text message" do
    it "outputs delivery message" do
      time = Time.new
      local_text = Text.new(order)
      formatted_time = local_text.format_time(time)
      expect( local_text.message(time) ).to eq("Thank you! Your order was placed and will be delivered before #{formatted_time}.")
    end


    # it 'raises error if order.add_total is not correct' do
    #   expect { text.message }.to raise_error("I'm sorry, there's an error in the total. Please place your order again.")
    # end
  end

  # context "send text via Twilio" do
  #
  # end
end

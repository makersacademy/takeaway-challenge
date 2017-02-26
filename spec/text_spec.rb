require 'text'

describe Text do
  subject(:text){described_class.new}
  let(:phone_number){double :phone_number}
  # let(:restaurant){Restaurant.new('Lucky Dragon')}

it 'sends a payment confirmation text message' do
    expect(text).to receive(:send_SMS).with("Thank you! Your order was placed and will be delivered before #{Time.now + (60*60)}. Total price: £34.95")
    text.confirmation(34.95, :phone_number)
  end
end

# Feature Test

require 'menu'
require 'twilio-ruby'

describe Menu do

  subject(:menu) { described_class.new }

  it 'displays the food menu with prices' do
    expected_values = menu.display
    expected_values.each do |key, value|
      price = key
      food  = value
      expect(price).equal?(food)
    end
  end

  it 'check the total of given matches my selected items' do
    my_lunch = []
    total = 0
    my_options = menu.display
    my_options.each do |key, value|
      if key.to_i < 6
        my_lunch.push(key)
      end
    end
    my_lunch.each do |x|
      total += x.to_i
    end
    expect(menu.calculate).to eq(total)
  end

  context '#sms' do
    let(:send_sms) { double('fake sms') }

    it 'sends sms confirmation of order' do
      allow(send_sms).to receive(:sms).and_return(true)
    end
  end


end

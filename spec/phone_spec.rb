require 'phone'

describe Phone do
  subject(:phone) { described_class.new }

  it 'can send a text' do
    allow(phone).to receive(:send_text)
    expect(phone).to receive(:send_text)
      .with('Thank you! Your order was placed and will be delivered before'\
            " #{(Time.now + 3600).strftime("%H:%M")}.")
    phone.complete_order
  end
end

require 'text'
require 'time'

describe Text do

  it 'sends a text' do
    fake_message = {
      from: '123',
      to: '456',
      body: 'testing my message'
    }

    expect(subject).to receive(:send_text).with(fake_message)
    subject.send_text(fake_message)
  end

  it 'has a delivery time of an hour' do
    allow(Time).to receive(:now).and_return(Time.parse("19:00"))

    expect(subject.message_body).to eq "Thank you! Your order was placed and will be delivered before 20:00"
  end

  it 'contains a "from" and "to" number' do
    expect(subject.customer_message).to include({ from: be_an(String), to: be_an(String), body: be_an(String) })
  end
end

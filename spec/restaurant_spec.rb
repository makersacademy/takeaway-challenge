require 'restaurant'

describe Restaurant do
  let(:my_order) { double(:order) }
  let(:time_now) { 1_641_556_544 }
  let(:wait) do 
    wait_time = time_now + Restaurant::WAIT_TIME
    ready = Time.at(wait_time)
  end
  let(:fake_twilio) { double(:twilio).as_null_object }
  let(:mobile_number) { '07000 123 123' }
  let(:message) { "Thank you! Your order was placed and will be delivered before #{wait.strftime('%H:%M')}" }

  it 'receives order and responds with a message' do
    allow(Time).to receive(:now).and_return(time_now)
    allow(Twilio::REST::Client).to receive(:new).and_return(fake_twilio)
    expect(subject.place(my_order, mobile_number)).to eq message
  end

end

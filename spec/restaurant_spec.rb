require 'restaurant'

describe Restaurant do
  let(:my_order) { double(:order) }
  let(:time_now) { 1_641_556_544 }
  let(:wait) do 
    wait_time = time_now + Restaurant::WAIT_TIME
    ready = Time.at(wait_time)
  end
  let(:ready) { double() }
  let(:message) { "Thank you! Your order was placed and will be delivered before #{wait.strftime('%H:%M')}" }

  it 'receives order and responds with a message' do
    allow(Time).to receive(:now).and_return(time_now)
    expect(subject.place(my_order)).to eq message
  end

end

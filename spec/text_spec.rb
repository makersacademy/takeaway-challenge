require 'text'

describe Text do
  it 'initializes with @from an environmental variable' do
    expect(subject.from).to eq ENV['SECRET_TWILIO_NUMBER']
  end

  it 'initializes with @to an environmental variable' do
    expect(subject.to).to eq ENV['MY_SECRET_NUMBER']
  end

  it 'sends a text confirming the order has been made' do
    text = double('Text')
    time = (Time.now + 4000).strftime('%I:%M %p')
    allow(text).to receive(:send_text).and_return(time)
    expect(text.send_text).to eq time
  end 
end

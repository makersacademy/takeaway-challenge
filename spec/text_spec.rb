require 'text.rb'
require 'twilio-ruby'

describe TextConfirm do
  it 'initialises with @from with an environmental variable' do
    expect(subject.from).to eq ENV['SECRET_TWIL_NUM']
  end

  it 'initialises with @to with an environmental variable' do
    expect(subject.to).to eq ENV['SECRET_MOBILE']
  end

  it 'confirms that the order has been made' do
    text = double('Text')
    time = (Time.now + 3600).strftime('%I:%M %p')
    allow(text).to receive(:confirmation).and_return(time)
    expect(text.confirmation).to eq time
  end
end

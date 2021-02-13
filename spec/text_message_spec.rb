require 'text_message'

describe TextMessage do

  it 'confirms that the order has been made' do
    text = double('Text')
    time = (Time.now + 3600).strftime('%I:%M %p')
    allow(text).to receive(:confirm).and_return(time)
    expect(text.confirm).to eq time
  end
  
end

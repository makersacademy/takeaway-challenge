require 'texting'

describe Texting do

  before(:each) do
    allow(Texting).to receive(:send_text).and_return("A text has been sent with your delivery time!")
  end

  it 'knows the time it will be delivered' do
    time = "#{Time.new.hour + 1}.#{Time.new.min}"
    expect(subject.delivery_time).to eq(time)
  end

end

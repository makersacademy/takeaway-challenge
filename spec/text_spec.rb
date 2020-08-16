require 'text'

describe Text_message do
    it 'gets the current time and adds an hour' do
    time_now = Time.now
    allow(Time).to receive(:now).and_return(time_now += 1*60*60)
    expect(subject.delivery_time).to eq (time_now += 1*60*60 )
    end

    it 'sends a text to the user with the expected time' do
        expect(subject.send_text).to include("Your order was placed")
    end
end
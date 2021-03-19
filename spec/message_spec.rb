require 'message'

describe Message do
    it 'sends a message after order has been made' do
        expect(subject.complete).to end_with("#{(Time.now + 1*60*60).strftime("%I:%M%p")}")
    end
end 
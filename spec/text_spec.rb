require 'text'

describe Text do

    it 'sends a text to the user to confirm their order' do
        expect(subject).to respond_to(send_confirmation)
    end
end
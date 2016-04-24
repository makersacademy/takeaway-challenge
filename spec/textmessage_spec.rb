require 'textmessage'

 

describe TextMessage do 
	subject(:textmessage) {described_class.new(client: client)}
	let(:client) {double :client}

	it 'sends the desired message' do
		expect(textmessage.deliver).to eq "Thank you! Your order was placed and will be delivered before 18:52"
	end



		
end
require 'text'

describe Text do
	subject(:text) {described_class.new}
	let(:number) {double "07966793842"}
	let(:client) {double :client}
	let(:messages) {double :messages}

	context '#message' do
		it 'sends a message' do	
			allow(messages).to receive(:create)
			expect(client).to receive(messages)
			text.message
		end
	end
end
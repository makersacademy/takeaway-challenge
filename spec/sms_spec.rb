require 'sms'

describe SMS do

	subject(:sms) {described_class.new(client)}
	let(:client) {double :client, messages: messages}
	let(:messages) {double :messages}
	let(:message) {double :message}
	let(:phone_number) {double :phone_number}
	
	describe '#send' do
		it 'sends an sms' do
			expect(messages).to receive(:create)
			sms.send(message)
		end
	end

end
require 'send_sms'

describe SMS do
subject(:sms){described_class.new }
let(:total){double :total}
	
	describe '#send_sms(total)' do
		it 'should responds with an argument' do
			expect(sms).to respond_to(:send_sms).with(1).argument		
			end

		it 'should create a sms' do
			expect(sms).to receive(:send_sms).with(total)
			sms.send_sms(total)
		end
	end

end

require 'confirm'

describe Confirm do

	subject(:confirm) { described_class.new }

	describe 'responds to' do
		it { is_expected.to respond_to(:send_sms) }
	end

	
	
end
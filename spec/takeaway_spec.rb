require 'takeaway'

describe Takeaway do

	subject(:takeaway) { described_class.new }
	let(:menu) { double :menu }

	describe 'responses' do
    it { should respond_to :menu }
    it { should respond_to :place_order }
	end

	describe '#menu' do
		it 'doesn\'t raise an error' do
			expect{takeaway.menu}.to_not raise_error
		end
	end

end


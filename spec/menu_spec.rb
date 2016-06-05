require 'menu'

describe Menu do

	let(:subject) { described_class.new }

	describe 'responses' do

		 it { should respond_to(:data) }

	end



end

require 'establishment'

describe Establishment do
	let(:menu){ spy(:menu) }
	subject(:establishment){ described_class.new(menu) }

	context '#view_menu' do
		it 'tells its menu object to show the list of items and prices' do
			establishment.view_menu
			expect(menu).to have_received(:list)
		end
	end

end
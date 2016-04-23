require 'establishment'

describe Establishment do
	let(:menu){ double(:menu, list: nil) }
	let(:checker){ spy(:checker) }
	subject(:establishment){ described_class.new(menu,checker) }

	context '#view_menu' do
		it 'tells its menu object to show the list of items and prices' do
			expect(menu).to receive(:list)
			establishment.view_menu
		end
	end

	context '#place_order' do
		it 'asks the checker object whether the order passes' do
			allow(menu).to receive(:list){ "MOCK LIST"}
			establishment.place_order(100,item1:1,item2:2,item3:3)
			expect(checker).to have_received(:pass?).with(100,{item1:1,item2:2,item3:3},"MOCK LIST")
		end
	end

end
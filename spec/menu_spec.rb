require 'menu'

describe Menu do
subject(:menu){described_class.new}

	describe '#list' do
		it 'should return a list of dishes' do
			expect(menu.list).to include ({"Pepperoni Pizza" => 6.00})
		end
	end

end
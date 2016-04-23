require 'menu'

describe Menu do 

	subject(:menu) {described_class.new}
	let(:dishes) { {"pizza":1, "Berger":2}}

	describe '#display' do
		it "dish includes pizza" do
			expect(menu.display(dishes)).to include(:pizza=>1)
		end
	end

end

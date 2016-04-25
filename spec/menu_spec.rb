require 'menu'

describe Menu do 

	subject(:menu) {described_class.new}
	let(:dishes) { {"pizza"=>1,"burger"=>2,"fries"=>1.5}}

	describe '#print_dish' do
		it "returns dishes" do
			expect(menu.print_dish).to eq dishes
		end
	end

	describe '#present?' do
		it "returns true if item is on the menu" do
			expect(menu.present? 'pizza').to eq true
	  end

	  it "returns false if item is not on the menu" do
	  	expect(menu.present? 'chicken').to eq false
	  end
  end
end

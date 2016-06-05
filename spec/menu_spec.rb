require "menu"

describe Menu do

subject(:menu) {described_class.new(list)}
let(:list) do
	{ Pizza: 4,
		Green_Shake: 4.5}
end


	it "stores a hash with dishes and prices" do
		expect(menu.list).to respond_to :each
	end

	it "shows the list of dishes and prices" do
		shown_menu = "Pizza £4, Green Shake £4.5"
		expect(menu.show).to eq(shown_menu)
	end

end

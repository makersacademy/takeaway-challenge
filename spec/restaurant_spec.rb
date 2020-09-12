require "restaurant"
describe Restaurant do 
	let(:menu) { double :menu }
	it "has a menu" do
	expect(subject.menu).to eq(menu)
	end 
end 
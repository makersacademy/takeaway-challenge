require './lib/menu'

describe Menu do
	let(:menu) { Menu.new } 
	it "displays a list of dishes with prices" do 
		expect{ menu.view }.to output(/Chirashi/).to_stdout
	end
end


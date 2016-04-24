require 'menu'

describe Menu do 

	subject(:menu){ described_class.new }

	describe "#initialize" do  
	  it "list of dishes with prices" do
			expect(menu.items).to be_a Hash
	  end 
	end

	describe "#view_menu" do
		it "allows customer to view menu" do
			expect(menu.view_menu).to eq menu.items
		end
	end

	describe "#on_menu" do
		it "checks the item is on the menu" do
			expect(menu.on_menu?(:gravy)).to eq false
			expect(menu.on_menu?(:chips)).to eq true
		end
	end

end
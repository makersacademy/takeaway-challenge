require 'menu'

describe Menu do  

	 subject(:menu) { described_class.new(dishes) }  

	 let(:dishes) do
 		 { 
  	    "Tuckeroo" => 5.50,
  		"Dim sum platter" => 11.00,
      	"Shrimp fu yung" => 8.80,
      	"Mongolian lamb" => 7.70,
      	"Egg fried rice" => 3.30,
      	"Prawn crackers" => 2.20
  		}
 	end

	 it "accesses dishes attribute of menu class expecting it to equal dishes hash of (dish/price, key/value) pairs" do
 		 expect(menu.dishes).to eq(dishes)
 	end

	 it "calls print on menu expecting to equal printed_menu" do
 		 printed_menu = "Tuckeroo £5.50, Dim sum platter £11.00, Shrimp fu yung £8.80, Mongolian lamb £7.70, Egg fried rice £3.30, Prawn crackers £2.20"
 		 expect(menu.print).to eq(printed_menu)
 	end

	 it "calls dish? on itself taking one arg (dish in question) expecting it to equal true if dish in menu hash" do 
 		 expect(menu.dish?("Dim sum platter")).to be true
 	end

	 it "calls dish? on itself taking one arg (dish in question) expecting it to equal false if dish absent from menu hash" do 
 		 expect(menu.dish?(:shark)).to be false
 	end

	 it "calls price on itself with one arg (menu attribute dishes key) expecting it to equal the dishes corresponding (menu attribute dishes value) price of that hash pair" do
 		 expect(menu.price(:tuckeroo)).to eq(dishes[:tuckeroo])
 	end
end

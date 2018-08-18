require 'bill'

describe Bill do

  let(:bill) { Bill.new }

  describe ".create" do
    it { is_expected.to respond_to(:create).with(1).argument }
    it "will display the order bill" do
      expect { bill.create([["Burger & Chips", 2, 7], ["Donner Kebab", 2, 8]]) }.to output("DISH || QUANTITY || PRICE\nBurger & Chips || 2 || 7\nDonner Kebab || 2 || 8\nTOTAL = £30\n").to_stdout
    end
    
  end

  
  describe ".total" do
    it { is_expected.to respond_to(:total).with(1).argument }

    it "will return the total price of the order" do
      expect(bill.total([["Burger & Chips", 2, 7], ["Donner Kebab", 2, 8]])).to eq(30)
    end
  end
  
  

end

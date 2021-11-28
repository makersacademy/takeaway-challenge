require 'checkout'

describe CheckOut do

  describe "test calculate_total" do
    let!(:checkout) { CheckOut.new } 
    let!(:menu) {double "fakemenu", :receipt_list => [10, 4, 8] }

    xit "returns the total for 1 item in the basket" do
      fake_list = [12.5 ]
      allow(menu).to receive(:receipt_list).and_return(fake_list)
      expect(menu.receipt_list).to be(fake_list)
      expect(checkout.calculate_total(fake_list)).to eq 12.5
    end

    it "returns the total for 3 items in the basket" do
      fake_list = [10, 4, 8]
      allow(menu).to receive(:receipt_list).and_return([10, 4, 8])
      expect(menu.receipt_list).to be(:receipt_list)
      expect(checkout.calculate_total(receipt_list)).to eq 22
    end
  end

  # describe "test view_basket method" do
  #   let!(:checkout) { CheckOut.new } 
  #   let!(:menu) {double "fakemenu"}
  #   let!(:basket) {[["KFC", 6], ["Bibimba_chicken", 10], ["Rice", 3]]}
  #   context "user has one or more item(s) to the basket" do
  #     it "shows one meal" do
  #       # expect(menu).to receive(:basket).and_return [["KFC", 6], ["Bibimba_chicken", 10], ["Rice", 3]]
  #       # fake_basket = ([["KFC", 6], ["Bibimba_chicken", 10], ["Rice", 3]])
  #       # allow(menu).to receive(:basket).and_return([["KFC", 6], ["Bibimba_chicken", 10], ["Rice", 3]])
  #       # allow_any_instance_of(menu).to receive(:basket)
  #       # expect(menu.basket).to be_an_instance_of(Array)
  #       expect{ checkout.view_basket(:basket) }.to output([["KFC", 6], ["Bibimba_chicken", 10], ["Rice", 3]].to_s).to_stdout
  #       # expect(checkout.view_basket(basket)).to eq([["KFC", 6], ["Bibimba_chicken", 10], ["Rice", 3]])
  #     end
    
      # it "show several meals" do
      #   menu.choose_meal(2)
      #   menu.choose_meal(4)
      #   expect(checkout.view_basket).to eq([["KFC", 6], ["Bibimba_chicken", 10]])
      # end
  #   end
  # end

end

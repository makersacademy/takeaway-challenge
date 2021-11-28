require 'checkout'

describe CheckOut do

  describe "test calculate_total" do
      let!(:checkout) { CheckOut.new } 
      let!(:menu) {double "fakemenu"}

      it "returns the total for 1 item in the basket" do
        fake_list = [12.5 ]
        allow(menu).to receive(:receipt_list).and_return(fake_list)
        expect(menu.receipt_list).to be(fake_list)
        expect(checkout.calculate_total(fake_list)).to eq 12.5
      end

      it "returns the total for 3 items in the basket" do
        fake_list = [10, 4, 8]
        allow(menu).to receive(:receipt_list).and_return(fake_list)
        expect(menu.receipt_list).to be(fake_list)
        expect(checkout.calculate_total(fake_list)).to eq 22
      end
    # context "several dishes" do

    # end
  end
end

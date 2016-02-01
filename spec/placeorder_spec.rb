require "./lib/placeorder.rb"

describe PlaceOrder do
  subject(:placeorder) {described_class.new}
  let(:order) {double (:order)}
  let(:confirmation) {double (:confirmation)}
  # context "#initialize" do
  #   it "" do

  #   end
  # end

  context "#final_check" do
    it "should add the price and compare to previous price calculation" do
      order.select("Chicken")
      order.select("Fish")
      expect(placeorder.final_check).to eq order.final_price
    end
    it "raise error if final_price is greater than intended" do
      order.select("Chicken")
      order.select("Fish")
      order.final_price += 1
      message = "price does not match what you paid for please resart order process"
      expect{(placeorder.final_check)}.to raise_error message
    end
  end

  context "#green_light" do
    it "should send a confirmation text" do
      expect(placeorder.green_light).to eq confirmation
    end
  end
end
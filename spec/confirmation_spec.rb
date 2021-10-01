require "confirmation"

describe "Confirmation" do
  describe ".initialize" do
    it "should create a confirmation text detailing when the cusotmer should receive their food by" do
      order_time = Time.new(2021, 10, 01, 12, 27)
      # order_time = Time.now
      puts order_time
      confirmation = Confirmation.new(order_time)
      expect(confirmation.content).to eq("Thank you! Your order was placed and will be delivered before 13:27")
    end
  end
end
require "menu"

RSpec.describe Menu do
  describe "#initialize" do
    it "initializes with a menu hash" do
      expect(subject.dishes). to eq({ "pepperoni" => 8, "veggie" => 8, "hawaiian" => 9, "bbq chicken" => 10 })
    end
  end


  describe "#print" do
    it "takes the menu hash and prints in a menu format" do
        expect(subject.print). to eq("pepperoni: £8. veggie: £8. hawaiian: £9. bbq chicken: £10. ")
    end
  end
end

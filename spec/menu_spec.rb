require "menu"

RSpec.describe Menu do
  describe "#print" do # FAILING. It's not saving the result, just printing it. Need to alter test or find out way to store result in variable
    it "takes the menu hash and prints in a menu format" do
        expect(subject.print). to eq("pepperoni: £8. veggie: £8. hawaiian: £9. bbq chicken: £10. ")
    end
  end
end

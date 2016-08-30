require "order"

describe Order do
  let(:menu) {    {"Celery Cupcakes" => 2.95,
                  "Lacto-Free Milk" => 1.95,
                  "Fat-Free Butter" => 3.50} }


  describe "#add_to_basket" do
    it "adds items to the basket" do
      expect{subject.add_to_basket("Celery Cupcakes", 2)}.to change { subject.basket.count }.by(2)
    end

    it "raise an error if the user orders something not on the menu" do
      expect(subject.add_to_basket("Burger")).to raise_error { "That wasn't on the menu" }
      end
    end


  describe "#total" do
    it "is 0 when basket is empty" do
      expect(subject.total).to eq(0)
    end

    it "shows the total price of basket" do
      subject.add_to_basket("Celery Cupcakes", 2)
      expect(subject.total).to eq 5.9
    end
  end
end

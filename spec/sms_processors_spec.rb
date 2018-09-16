require 'sms_processors'

describe SMSProcess do
  describe "#break_up_input" do
    it "should return an input_array for one dish" do
      expect(subject.break_up_input("Butterbeer, 2, 6")).to eq ["Butterbeer", "2"]
    end

    it "should return an input_array, two dishes" do
      expect(subject.break_up_input("Butterbeer, 2, Chocolate Frogs, 1, 11")).to eq ["Butterbeer", "2", "Chocolate Frogs", "1"]
    end
  end

  describe "#format_dish_input" do
    it "should return a dish_array for one dish" do
      expect(subject.format_dish_input(["Butterbeer", "2"])).to eq [["Butterbeer", 2]]
    end

    it "should return an dish_array, two dishes" do
      expect(subject.format_dish_input(["Butterbeer", "2", "Chocolate Frogs", "1"])).to eq [["Butterbeer", 2], ["Chocolate Frogs", 1]]
    end
  end

  describe "#add_dishes_to_order" do
    let(:menu) { double :Menu_Double, choose: true }
    it "should call Menu#choose" do
      expect(subject.add_dishes_to_order([["Butterbeer", 2]], menu)).to eq [["Butterbeer", 2]]
    end
  end

  describe "#price_check" do
    let(:menu) { double :Menu_Double, confirm_order: true }
    it "should call Menu#confirm_order" do
      expect(subject.price_check(menu)).to eq true
    end
  end
end

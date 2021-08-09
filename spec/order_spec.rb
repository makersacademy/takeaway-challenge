require "order"

describe Order do
  let(:menu) { double(Menu, main_menu: [{ Pasta: 9 }, { Risotto: 10 }, { Salad: 8 }]) }
  let(:subject) { Order.new(menu) }

  describe "#see_menu method" do
    it "should let us see a list of dishes with prices" do
      expect { subject.see_menu }.to output(include("Pasta", "9", "Risotto")).to_stdout
    end
  end

  describe "#select_meals method" do
    it "should let us select multiple dishes" do
      subject.select_meals([1, 3])
      expect(subject.selected_meals).to eq(subject.main_menu.values_at(0, 2))
    end
  end

  describe "#check_total method" do
    it "should let us check the total price of the selected dishes" do
      subject.select_meals([1, 3])
      expect { subject.check_total }.to output("Order total = £17\n").to_stdout
    end
  end
end

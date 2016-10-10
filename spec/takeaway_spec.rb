require 'takeaway'

describe Takeaway do

  let(:order) {Order.new}
  let(:penne) {Dish.new("Penne con la sabbia", 3)}
  let(:menu) {double(:menu, menu: print_menu)}
  # let(:print_menu) {dish: "cianfrusaglie alla rinfusa", price: 3}, {dish: "raudi accesi", price: 3}, {dish: "fragole alla carbonara", price: 14}

  describe "#see_menu" do
    it 'should print the menu on the screen' do
      expect(subject.see_menu).to include({dish: "cianfrusaglie alla rinfusa", price: 3})
    end
  end

  describe "#add" do
    it "should add the price of the item to the total amount" do
      expect{subject.add(penne)}.to change{ subject.total }.by 3
    end

    it "should add the price of the item to the total amount" do
      expect{subject.add(penne, 3)}.to change{ subject.total }.by 9
    end
  end

  describe "#basket_summary" do
    it "should print the order" do
      subject.add(penne)
      expect{subject.basket_summary}.to output("Your order: \nPenne con la sabbia x 1 = 3£ ").to_stdout
    end
  end

end

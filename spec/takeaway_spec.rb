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

  end

  # describe "#remove" do
  #   it "should remove item from the order class" do
  #
  #   end
  #
  #   it "should remove the amount from the total" do
  #     expect{subject.remove(margherita)}.to change{ subject.total }.by -5
  #   end
  # end
  #
  # describe "total" do
  #   it "should return the total amount" do
  #     subject.add(pazza)
  #     expect(subject.total).to eq(22)
  #   end
  # end


end

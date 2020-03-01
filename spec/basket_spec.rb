require "basket"
shared_context "common basket" do

  #dummy basket
  let(:dish_two_basket) {{dish: "chips", price: 0.5, ordered: 5}}
  let(:dish_three_basket) {{dish: "ramen", price: 0.9, ordered: 10}}
  let(:basket) {[dish_two_basket, dish_three_basket]}
end

describe Basket do
  include_context "common basket"

  context "initialized instance variable" do
    it "contents" do
      expect(subject.instance_variable_get(:@contents)).to eq([])
    end
  end
  
  context "method responds to" do
    it "#print" do
      expect(subject).to respond_to(:print)
    end
    it "#add" do
      expect(subject).to respond_to(:add).with_keywords(:dish, :ordered, :price)
    end
    it "#details" do
      expect(subject).to respond_to(:details)
    end
    it "#empty" do
      expect(subject).to respond_to(:empty)
    end
  end

  context "method functionality" do
    it "#print prints out contents of basket" do
      subject.add(dish_two_basket)
      subject.add(dish_three_basket)
      expect{subject.print}.to output("Basket\n\nx5 chips      £2.5\nx10 ramen      £9.0\ntotal:      £11.5\n").to_stdout
    end
    it "#add displays success message after add" do
      expect{subject.add(dish_two_basket)}.to output("x5 orders of chips are in your basket :)\n").to_stdout
    end
    it "#details returns contents" do
      subject.add(dish_two_basket)
      subject.add(dish_three_basket)
      expect(subject.details).to eq(basket)
    end
    it "#empty empties basket and confirmation message" do
      subject.add(dish_two_basket)
      subject.add(dish_three_basket)
      expect{subject.empty}.to output("emptied basket successfully\n").to_stdout
    end
  end
end
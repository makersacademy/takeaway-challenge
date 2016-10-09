require 'takeaway'

describe Takeaway do

  let(:margherita) { double :dish, price:5 }
  let(:diavola) { double :dish, price:6 }
  let(:pazza) { double :dish, price:22 }

  # describe "#see_menu" do
  #   it 'should print the menu on the screen' do
  #     expect{subject.see_menu}.to eq()
  #   end
  # end

  # describe "#add" do
  #   it "should add the price of the item to the total amount" do
  #     expect{subject.add(margherita)}.to change{ subject.total }.by 5
  #   end
  # end

  # describe "set_quantity" do
  #   it "should set the quantity of the item" do
  #
  #   end
  # end

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

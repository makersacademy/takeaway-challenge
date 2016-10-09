require 'takeaway'

describe Takeaway do

  let(:biscottini) {Dish.new("Biscottini", 4)}
  let(:penne) {Dish.new("Penne con la sabbia", 3)}

  # describe "#see_menu" do
  #   it 'should print the menu on the screen' do
  #     expect{subject.see_menu}.to eq()
  #   end
  # end

  describe "#add" do
    it "should add the price of the item to the total amount" do
      @quantity = 1
      expect{subject.add(penne)}.to change{ subject.total }.by 3
    end

    it "should add the price of the item to the total amount" do
      @quantity = 1
      expect{subject.add(penne)}.to change{ subject.total }.by 9
    end

  end


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

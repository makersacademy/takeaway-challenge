require 'takeaway.rb'

describe Takeaway do
  describe "#initialize" do
    context "when created" do
      it "shows menu" do
        expect { subject.menu }.not_to raise_error
      end
    end
  end
  #
  describe "#order" do
    context "when requested" do
      it "can order food" do
        # expect { subject.order }.not_to raise_error
        expect(subject).to respond_to(:order).with(1).argument
      end
      it "throws an error if the dish is not on menu" do
         dish = "whatever"
        expect{subject.order(dish)}.to raise_error "Not on the menu, please try again"
      end
      it "adds the dish to the basket" do
        dish = "Pizza"
         expect{ subject.order(dish) }.to change{ subject.basket }.by [dish]
        # expect{t.order(dish)}.to have_key(subject.menu)
      end
    end
  end


end

require 'customer'
require 'menu'
require 'order'

describe Order do

  let(:subject) {
    menu = Menu.new({ "kimchi" => 5, "fried rice" => 7, "salmon" => 10 })
    customer = Customer.new("1234")
    Order.new(menu, customer) 
  }
  
  it "should have a total of 0 when empty" do 
    expect(subject.total).to eq 0
  end

  describe "#add_dish" do

    it "should add a dish from the menu" do
      subject.add_dish("kimchi", 1)
    end

    it "should not allow dishes that are not on the menu" do
      expect { subject.add_dish("chicken", 1) }.to raise_error "Item not on the menu."
    end

    it "should add multiples of the same dish to the basket" do
      expect(subject.add_dish("kimchi", 2))
    end
  

    # describe "#remove dish" do
    #   it "should remove a dish from the menu" do
    #     subject.add_dish("fried rice", 1)
    #     expect(subject.remove_dish("fried rice", 1))
    #   end
    # end
  end

  describe "#total" do
    it "should return total for one item" do
      subject.add_dish("kimchi", 1)
      expect(subject.total).to eq 5
    end

    it "should return the total for multiple items" do
      subject.add_dish("kimchi", 1)
      subject.add_dish("fried rice", 2)
      expect(subject.total).to eq 19
    end

  end

  describe "#order summary" do
    it "should return a summary of the order" do
      subject.add_dish("kimchi", 1)
      expect(subject.summary).to eq "kimchi x 1 = £5"
    end
  end
end

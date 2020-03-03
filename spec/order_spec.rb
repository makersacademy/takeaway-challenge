require "order"
describe Order do
  it { is_expected.to respond_to(:add).with(2).argument }
  it { is_expected.to respond_to(:show_order) }
  # it { is_expected.to respond_to(:checkout) }
  
  describe "#add" do
    it "adds an item to the order" do
      subject.add("Pizza")
      expect(subject.order).to eq [{ "Pizza" => 9 }]
    end

    it "adds more than one item to the order" do
      subject.add("Pizza")
      subject.add("Pasta")
      expect(subject.order).to eq [{ "Pizza" => 9 }, { "Pasta" => 6 }]
    end

    it "adds an item twice" do
      subject.add("Pizza", 2)
      expect(subject.order).to eq [{ "Pizza" => 9 }, { "Pizza" => 9 }]
    end
      
    it "raises an error when something not on menu" do 
      expect { subject.add("mud") }.to raise_error "Item not on the menu."
    end
  end

  describe "#show_order" do
    it "returns the order" do 
      subject.instance_variable_set :@order, [{ "Pizza" => 9 }, { "Pasta" => 6 }]
      expect { subject.show_order }.to output("Pizza - £9\nPasta - £6\n").to_stdout
    end
  end

  describe "#total" do 
    it "returns a total of the order" do
      subject.add("Pizza")
      subject.add("Pasta")
      expect(subject.total).to eq "Order total is £15"
    end

    it "raises an error when check total and order empty" do
      expect { subject.total }.to raise_error "Basket is empty"
    end
  end

  describe "#checkout" do
    it "returns 'order placed' when you checkout and order" do 
      expect(subject).to receive(:checkout).and_return("Order placed")
      subject.add("Pizza")
      expect(subject.checkout).to eq "Order placed"
    end

    it "returns an error when you try to checkout an empty order" do
      expect{subject.checkout}.to raise_error "Basket is empty"
    end
      
  end
end

require "order"
describe Order do
  it { is_expected.to respond_to(:add).with(2).argument }
  it { is_expected.to respond_to(:show_order) }
  
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
      subject.instance_variable_set :@order, ([{ "Pizza" => 9 }, { "Pasta" => 6 }])
      expect{subject.show_order}.to output("Pizza - £9\nPasta - £6\n").to_stdout
    end
  end
end

require 'order'
require "menu"
describe Order do
  it "has an instance of Menu class as an instance variable" do
    expect(subject.instance_variable_get(:@menu)).to be_an_instance_of(Menu)
  end
  it {is_expected.to respond_to(:select)}
  describe "#select" do


    it "is expected to raise an error if no dish selected" do
      expect { subject.select() }.to raise_error "Please select at least one dish"
    end
  
    it "should store a single order order" do
      subject.select("roadkill jumbalaya")
     #expect(subject.instance_variable_get(:@current_order)).to eq ([{ food: "roadkill jumbalaya", price: 7 }])
      #expect(subject.current_order).to eq ([{ food: "roadkill jumbalaya", price: 7 }])
    end

    it "should store multiple item orders" do
      subject.select("roadkill jumbalaya", "stawberry lasagne", "vinegar yogurt")
      #expect(subject.instance_variable_get(:@current_order)).to eq ([{ food: "roadkill jumbalaya", price: 7 }, { food: "stawberry lasagne", price: 20 }, { food: "vinegar yogurt", price: 3 }])
    end
  end
end
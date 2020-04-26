require "customer_selection"
require "stringio"

describe CustomerSelection do
  let(:subject) { described_class.new }
  let(:item) { :tea}
  let(:item2) { :stew }
  let(:quantity) { 2 }

  it "responds to add method" do
    expect(subject).to respond_to(:add).with(2).arguments
  end
  
  describe "#add" do 
    context "input is valid" do
      it "adds item to order" do
        subject.add(item, quantity)
        expect(subject.selection).to include(item)
      end
    end
    
    context "input is not valid" do
      it "raises error" do
        expect{subject.add(item2, quantity)}.to raise_error "Item doesn't exist"
      end
    end
  end
  
  describe "#calculate_total" do
    it " calculates total" do
    subject.add(item, quantity)
    expect(subject.calculate_total).to eq(6)
  end
  end
  
  describe "#print_order" do
    it "prints selected dishes" do
      subject.add(item, quantity)
      expect(subject.print_order).to be_kind_of(Hash)
    end
  end
  
end
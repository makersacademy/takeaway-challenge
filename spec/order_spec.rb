require "order"

describe Order do
  let(:order) { described_class.new }
  let(:menu) { double :menu }

  it { expect(subject).to respond_to :show_menu }

  it { expect(subject).to respond_to :add_order }

  it { expect(subject).to respond_to :order_list }

  it { expect(subject).to respond_to :order_total }

  it "should print the menu" do
    expect(subject.show_menu).to eq Menu::DISHES
  end

  it "should allow the customer to select multiples of each item" do
    expect(subject.add_order("Pizza", 4)).to eq "You have ordered Pizza - x 4"
  end

  it "should have a default quantity of 1" do
    expect(subject.add_order("Pizza")).to eq "You have ordered Pizza - x 1"
  end

  it "should add the order to the order list" do
    subject.add_order("Lobster")
    expect(subject.order_list.length).to eq 1
  end

  context "multiple dishes ordered" do
    before(:each) do
      subject.add_order("Pizza", 4)
      subject.add_order("Lobster", 2)
    end

    it "should record multiple dishes" do
      expect(subject.order_list.length).to eq 2
    end

    it "should let you edit your selection" do
      subject.edit_selection("Pizza", 3)
      expect(subject.item_quantity("Pizza")). to eq 3
    end

    it "should let you remove a selection" do
      expect { subject.remove_selection("Pizza") }.to change { subject.order_list.length }.by -1
    end

  end

  context "Total" do
    before(:each) do
      subject.add_order("Pizza", 4)
      subject.add_order("Lobster", 2)
    end

    it "should match the sum of the dishes ordered" do
      expect(subject.order_total).to eq 40.0
    end
  end

  context "Raises" do

    it "should not allow a quantity of 0" do
      expect { subject.add_order("Lobster", 0) }.to raise_error("Can not select a quantity of 0")
    end

  end

end

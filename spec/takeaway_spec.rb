require 'takeaway'

describe Takeaway do
# let (:menu) {double :menu}
  let(:falseitem) { "Pizza" }
  let(:item) { "Veggi Wrap" }
  let(:testorder) { [{ Item: "Pizza", Quantity: 2, Price: 5 }] }
  let(:texter) { double :texter }
  let(:testtakeaway) { Takeaway.new(testorder) } 
  

  it { is_expected.to be_an_instance_of(Takeaway) }

  describe '#Initialize' do
    it "Instances of takeaway are are instantiated with menu instance variable" do
      expect(subject).to respond_to(:menu)
    end 
    it "Instances of takeaway are are instantiated with order instance variable" do
      expect(subject).to respond_to(:order)
    end
    it "New instances of takeaway have an empty array order" do
      expect(subject.order).to eq([])
    end
  end

  describe '#view_menu' do
    it "Instances of the takeaway class respond to view_menu method" do
      expect(subject).to respond_to(:view_menu)
    end
    it "Calling view_menu" do
      expect(subject.menu).to receive(:view)
      subject.view_menu
    end
  end

  describe '#add' do
    it "Instances of takeaway respond to add method with two arguments" do
      expect(subject).to respond_to(:add).with(2).arguments
    end
    it "Raises an error unless the user types in a real menu item" do
      expect { subject.add(falseitem) }.to raise_error "Please enter a item on the menu"
    end
    it "Adds items to the orders array" do
      expect { subject.add(item) }.to change { subject.order.length }.by(1)
    end
  end

  describe '#check_item' do
    it "Instances of takeaway respond to check_item method with 1 argument" do
      expect(subject).to respond_to(:check_item).with(1).argument
    end
    it "Returns true if user provides a real menu item" do # Here I need to make the test run more cohesively. As at the moment it checks the menu.
      expect(subject.check_item(item)).to eq(true)
    end
    it "Returns false if user provides a real menu item" do # Here I need to make the test run more cohesively. As at the moment it checks the menu.
      expect(subject.check_item(falseitem)).to eq(false)
    end
  end

  describe '#total' do
    it "Instances of takeaway respond to total method" do
      expect(subject).to respond_to(:total)
    end
    it "Returns the sum of the value of the items in the order" do # Here I need to change the test so that it doesn't depend on the menu so much.
      subject.add(item, 5)
      expect(subject.total).to eq("£27.50")
    end
  end

  describe '#header' do
    it "Instances of takeaway respond to header method" do
      expect(subject).to respond_to(:header)
    end
    it "Should print header" do
      expect { subject.header }.to output("-------------------------\n      Order Summary      \n-------------------------\n").to_stdout
    end
  end

  describe '#print_order' do
    it "Prints order" do
      expect { testtakeaway.print_order }.to output("-------------------------\n      Order Summary      \n-------------------------\n-------------------------\n\"Item: Pizza\"\n\"Quantity: 2\"\n\"Price: 5\"\n-------------------------\n").to_stdout
    end
  end

  describe '#checkout' do
    it "Calls the print_order method" do
      expect(testtakeaway).to receive(:print_order)
      testtakeaway.checkout
    end
    it "Displays total" do
      expect(testtakeaway).to receive(:total)
      testtakeaway.checkout
    end
  end

  describe '#complete_order' do
    before do
      allow(testtakeaway).to receive(:send_text)
    end

    it 'sends a payment confirmation text message' do
      expect(testtakeaway).to receive(:send_text).with("£10.00", "07123456789")
      testtakeaway.complete_order("07123456789")
    end
  end
end

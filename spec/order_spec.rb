require "order"

describe Order do

  subject(:order) { described_class.new }
  let(:takeaway) { double(:takeaway) }
  let(:restaurant) { double(:restaurant) }

  describe "#initialize" do
    it "ensures it gets initialized with a total =0" do
      expect(subject.total).to eq(0)
    end

    it "ensures it gets initialized with no items" do
      expect(subject.items).to eq([])
    end

    it "ensures a new order gets initialized with an id number" do
      expect(subject.id).to be_kind_of(Numeric)
    end

    order1 = Order.new
    order2 = Order.new
    order3 = Order.new
    order4 = Order.new

    [order2.id - order1.id, order3.id - order2.id, order4.id - order3.id].each do |id_difference|
      it "ensures that order id's increase by one with each order being made" do
        expect(id_difference).to eq(1)
      end
    end
  end

  describe "#print_restaurants" do
    it "calls method print_restaurants on takeaway instance when takeaway has restaurants" do
      allow(takeaway).to receive(:restaurants).and_return([1])
      allow(takeaway).to receive(:print_restaurants).and_return(1)
      expect(subject.print_restaurants(takeaway)).to eq(1)
    end
    it "raises error calling print_restaurants on takeaway instance when takeaway has no restaurants" do
      allow(takeaway).to receive(:restaurants).and_return([])
      allow(takeaway).to receive(:print_restaurants).and_return(1)
      expect { subject.print_restaurants(takeaway) }.to raise_error("There are no restaurants at this takeaway.")
    end
  end

  describe "#print_menu(restaurant)" do
    it "raises error calling print menu of a restaurant not in this takeaway" do
      allow(takeaway).to receive(:restaurants).and_return([])
      expect { subject.print_menu(takeaway, restaurant) }.to raise_error("This takeaway doesn't contain this restaurant.")
    end
    it "calls print menu on the takeaway given as argument" do
      allow(takeaway).to receive(:restaurants).and_return([restaurant])
      allow(takeaway).to receive(:print_menu).and_return(1)
      expect(subject.print_menu(takeaway, restaurant)).to eq(1)
    end
  end

end

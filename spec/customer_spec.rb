require 'customer'

RSpec.describe Customer do
  let(:menu_double) { double }
  let(:subject) { Customer.new(menu_double) }

  describe '#browse_menu' do
    it "stubs the order_food method" do
      subject.stub(:gets).and_return("y")
      allow(subject).to receive(:order_food) { 'method stubbed for tests' }
      expect(subject.order_food).to eq('method stubbed for tests')
    end
    it "checks menu in menu class" do
      menu_double = double :menu, show_menu: {
        "dishes" => "price",
        "Tortellini skewers" => 4,
        "Asparagus and mozerella parcels" => 5,
        "Spagetti Carbonara" => 8,
        "Margharita Pizza" => 7,
        "Selection of Icecream" => 3 }
      expect(menu_double.show_menu).to eq({
        "dishes" => "price",
        "Tortellini skewers" => 4,
        "Asparagus and mozerella parcels" => 5,
        "Spagetti Carbonara" => 8,
        "Margharita Pizza" => 7,
        "Selection of Icecream" => 3 })
    end
  end

  describe '#order_again' do
    it "stubs the order_food method" do
      subject.stub(:gets).and_return("y")
      allow(subject).to receive(:order_food) { 'method stubbed for tests' }
      expect(subject.order_food).to eq('method stubbed for tests')
    end

    it "stubs the process_order method" do
      subject.stub(:gets).and_return("y")
      allow(subject).to receive(:process_order) { 'method stubbed for tests' }
      expect(subject.process_order).to eq('method stubbed for tests')
    end
  end

  describe '#process_order' do
    it "provides the total from calculate_total in menu class" do
      subject.stub(:gets).and_return("y")
      menu_double = double :menu, calculate_total: "provides the total"
      expect(menu_double.calculate_total).to eq "provides the total"
    end
  end

  describe '#cancel_order' do
    it "shows when an order has been cancelled" do
      expect(subject.cancel_order).to eq "Your order has been cancelled."
    end
  end

  describe '#receive_notification' do
    it 'shows when the order has been processed' do
      menu_double = double :menu
      subject = Customer.new(menu_double)
      expect(subject.receive_notification).to include(
      "Thank you for ordering with us today and we hope you enjoy your meal!")
    end
  end
end

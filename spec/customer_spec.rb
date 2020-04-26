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

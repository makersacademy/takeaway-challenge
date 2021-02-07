require 'order'

RSpec.describe Order do
  
  before :each do
    @menu = double
    allow(@menu).to receive(:select).with("Margherita") { [{ dish: "Margherita", price: 8.45 }] }
  end

  describe '#menu' do
    it 'gets the full menu list' do
      expect(subject.menu).to eq subject.menu
    end
  end

  describe '#order' do
    it 'can receive a single dish as an order' do
      expect(subject.order_dish("Margherita")).to eq @menu.select("Margherita")
    end

    it 'can receive multiple dishes as an order' do
      subject.order_dish("Margherita")
      subject.order_dish("Salsiccia e Friarelli")
      expect(subject.order).to eq [ { dish: 'Margherita', price: 8.45 }, {dish: 'Salsiccia e Friarelli', price: 12.75} ]
    end
  end

end
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
      expect(subject.order).to eq [{ dish: 'Margherita', price: 8.45 }, { dish: 'Salsiccia e Friarelli', price: 12.75 }]
    end

    it 'can add several quantities of a type of dish' do
      subject.order_dish(3, "Prosciutto di Parma e Rucola")
      expect(subject.order).to eq [{ dish: 'Prosciutto di Parma e Rucola', price: 12.45 }, { dish: 'Prosciutto di Parma e Rucola', price: 12.45 }, { dish: 'Prosciutto di Parma e Rucola', price: 12.45 }]
    end

    it 'will not allow the order of a dish that is not on the menu' do
      expect { subject.order_dish("Gelato") }.to raise_error "This dish is not on the menu, please choose another one!"
    end
  end

  describe '#confirm_order' do
    it 'confirms order and returns the total price' do
      subject.order_dish("Margherita")
      expect(subject.confirm_order).to eq(8.45)
    end

    it 'confirms order and returns the total price of multiple dishes' do
      subject.order_dish("Margherita")
      subject.order_dish("Fritto Misto di Calamari")
      expect(subject.confirm_order).to eq(25.90)
    end
  end
end

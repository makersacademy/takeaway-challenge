require 'order'

describe Order do
  subject(:order) { described_class.new(menu_klass)}
  let(:menu_klass) { {"Dish 1" => 1.00,
                      "Dish 2" => 2.00,
                      "Dish 3" => 3.00 } }
  let(:dish) { double :dish }

  describe '#choose' do
    it 'should enable a user to select multiple quantities of dishes' do
      order.choose("Dish 2", 2)
      expect(order.dishes).to eq [["Dish 2", 2.0], ["Dish 2", 2.0]]
    end

    it "it doesn't allow items that are not on the menu to be added" do
      allow(menu_klass).to receive(:has_dish?).with(:chicken).and_return(false)
      expect { order.choose(:chicken, 2) }.to raise_error "This is not on the menu"
    end
  end

  describe '#calculate_quantities' do
    it 'calculates how many dishes have been ordered' do
      order.choose("Dish 2", 2)
      expect(order.calculate_quantities(order.dishes)).to be 2
    end
  end

  describe '#calculate_cost' do
    it 'calculates how much the order costs' do
      order.calculate_cost(order)
      expect(order.total).not_to be_nil #vacuous?
    end
  end

end

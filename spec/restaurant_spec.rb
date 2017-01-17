require 'restaurant'

ITEMS_LIST = [{:dish=>"Supa Minestrone", :qty=>3}, {:dish=>"Margherita", :qty=>3}]
TEST_MESSAGE = "Text Message"

describe Restaurant do
  subject(:restaurant){ described_class.new(ITEMS_LIST)}
  subject(:other_restaurant){ described_class.new}
  let(:menu){ double('menu') }
  let(:order){ double('order') }
  before :each do
    Menu.send(:remove_const, "FILENAME")
    Menu::FILENAME = "./lib/list_dishes_test.csv"
  end

  describe '#look_menu' do
    it 'check if want to order something' do
      expect(restaurant).to respond_to(:look_menu)
    end

    it 'Tests printer' do
      allow(menu).to receive(:printer).and_return("test")
      expect(restaurant.look_menu(menu)).to eq("test")
    end
  end

  describe '#choose_items' do
    it {is_expected.to respond_to(:choose_items).with(2).argument}

    it 'Choose items and quantities' do
      expect(restaurant.pre_order).to eq(ITEMS_LIST)
    end
  end

  describe '#calculate_amount' do
    it {is_expected.to respond_to(:calculate_amount)}

    context 'When preorder not empty' do
      it 'Calculates an amount' do
        allow(order).to receive(:calculate_total).and_return(6)
        expect(restaurant.calculate_amount).to eq(6)
      end
    end

    context 'When preorder empty' do
      it 'raises an error' do
        expect{other_restaurant.calculate_amount}.to raise_error("There are no items in the basket")
      end
    end
  end

  describe '#amount_check?' do
    it {is_expected.to respond_to(:amount_check?)}

    it 'Checks if calculations are well executaded' do
      allow(restaurant).to receive(:calculate_amount).and_return(1)
      allow(restaurant).to receive(:estimated_amount).and_return(1)
      expect(restaurant).to be_amount_check
    end
  end

  describe '#place_order' do
    it {is_expected.to respond_to(:place_order)}

    it 'Creates a new order' do
      allow(restaurant).to receive(:amount_check?).and_return(true)
      allow(restaurant.order).to receive(:confirmation).and_return(TEST_MESSAGE)
      expect(restaurant.place_order).to eq(TEST_MESSAGE)
    end

    it 'Raises error if total is incorrect' do
      allow(restaurant).to receive(:amount_check?).and_return(false)
      expect{ restaurant.place_order }.to raise_error("Incorrect sum")
    end
  end
end

require 'restaurant.rb'

describe Restaurant do
  subject(:restaurant) { described_class.new(:pizzeria) }
  let(:order) { double(:ask_order => [{ :item => 1, :name => :" TOMATO, GARLIC & OREGANO ", :price => 4.95, :quantity => 4 },
    { :item => 2, :name => :" TOMATO, MOZZARELLA, BASIL ", :price => 6.4, :quantity => 2 }], :total => 32.6)
  }
  let(:john) { double(:name => :John, :phone_number => '123', :check_order => true) }

  it { is_expected.to respond_to(:give_menu) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:send_sms) }

  describe '#record_order' do
    before do
      restaurant.record_order(john, order)
    end
    it 'records the food items' do
      expect(restaurant.food_items).to eq order.ask_order
    end

    it 'records the food items' do
      expect(restaurant.phone_number).to eq john.phone_number
    end

    it 'records the total' do
      expect(restaurant.total).to eq 32.6
    end
  end

  describe '#confirm_order' do
    it 'checks with the client the order is correct' do
      expect(restaurant.confirm_order(john)).to eq true
    end
  end

end

require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu, takeaway) }
  let(:takeaway) { double :takeaway }
  let(:menu) { double :menu }

  let(:valid_order) { [dish1, dish2] }
  let(:correct_cost) { 15 }
  let(:wrong_amount_tendered) { 12 }
  let(:dish1) { double :dish1, name: "Burrito", price: 5 }
  let(:dish2) { double :dish2, name: "Pizza", price: 10 }

  let(:bad_order) { [unserved_dish] }
  let(:correct_amount_tendered) { 1000 }
  let(:unserved_dish) { double :unserved_dish, name: "Waldorf Salad", price: 1000 }

  describe '#take_order' do
    it 'should raise an error if the total given does not equal the cost of the order' do
      allow(takeaway).to receive(:calculate_cost) { correct_cost }
      expect{ restaurant.take_order(valid_order, wrong_amount_tendered) }.to raise_exception("EXACT CHANGE PLEASE. Please provide exactly £#{correct_cost}")
    end

    it 'should raise an error if the order contains dishes which are not on the menu' do
      allow(takeaway).to receive(:calculate_cost) { correct_amount_tendered }
      allow(menu).to receive(:includes?) { false }
      expect{ restaurant.take_order(bad_order, correct_amount_tendered) }.to raise_exception("Sorry, food safety regulations prevent us from serving #{unserved_dish.name}!")
    end
  end


end

require 'order'

describe Order do
  let(:dish_id_1) { 1 }
  let(:dish_name_1) { 'dish_1' }
  let(:dish_price_1) { 4.5 }

  let(:dish) { double('a dish', id: dish_id_1, name: dish_name_1, price: dish_price_1) }

  let(:how_many_to_add_1) { 2 }
  let(:add_to_basket) { subject.add_to_basket(dish, how_many_to_add_1) }
  let(:add_to_basket_2) { subject.add_to_basket(dish, how_many_to_add_1) }

  context '#initialize' do
    it 'Has a @basket which is empty' do
      expect(subject.basket).to be_empty
    end
    it 'Has a @current_total set to zero' do
      expect(subject.current_total).to eq 0
    end
  end

  context '#add_to_basket' do
    it 'Can add to the basket' do
      expect(add_to_basket).to eq "Added #{how_many_to_add_1} of #{dish_name_1} to basket"
    end
    it 'If item already in basket, will add the extra quantity to the basket' do
      add_to_basket
      expect(add_to_basket_2
      ).to eq "Added #{how_many_to_add_1} more of #{dish_name_1} to basket"
    end
  end

  context '#current_total' do
    it 'Adding to the basket updates the total' do
      add_to_basket
      expect(subject.current_total).to eq dish_price_1 * how_many_to_add_1
    end
  end

  context '#print_order' do
    it 'Pretty prints the order and order total' do
      add_to_basket
      expect(subject.print_order
      ).to eq "#{dish_name_1} - £#{dish_price_1} x#{how_many_to_add_1}\n" +
      "Total: £#{dish_price_1 * how_many_to_add_1}"
    end
  end
end

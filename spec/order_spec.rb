require 'order'

describe Order do
  let(:object_type) { Dish }
  subject { Order.new(object_type) }

  let(:dish_name_1) { 'dish_1' }
  let(:how_many_to_add_1) { 2 }
  let(:add_to_basket) { subject.add_to_basket(dish_name_1, how_many_to_add_1) }

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
      expect(subject.add_to_basket(dish_name_1, how_many_to_add_1)
        ).to eq "Added #{how_many_to_add_1} more of #{dish_name_1} to basket"
    end
  end
end

require_relative '../lib/order'

describe Order do

  let(:basket) { [{"Name" => "Hamerburger", "Price" => "5"}] }

  context '#add_to_basket' do
    it 'Checks object responds to #order_dishes' do
      expect(subject).to respond_to(:add_to_basket)
    end

    it 'Checks order is put into basket' do
      dish = double :dish
      subject.add_to_basket(dish)
      expect(subject).to have_attributes(basket: [dish])
    end
  end
end
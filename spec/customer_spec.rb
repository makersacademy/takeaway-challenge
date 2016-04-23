require 'customer'

describe Customer do

  subject(:customer) { described_class.new(menu) }
  let(:menu) { double :menu, dishes: nil, select_dish: dish }
  let(:dish) { double :dish }
  
  it 'responds to list_dishes' do
    expect(customer).to respond_to(:list_dishes)
  end
  
  describe '#list_dishes' do
    it 'lists available dishes with prices' do
      expect(customer.list_dishes).to eq(menu.dishes)
    end
  end
  
  describe '#order' do

    it 'stores the order' do
      customer.order(dish)
      expect(customer.check_order).to include dish
    end
  
  end
  
end
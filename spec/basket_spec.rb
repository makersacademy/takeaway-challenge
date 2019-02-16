require 'basket'
describe Basket do
  let(:a_basket_item) { double :basket_item }
  it 'gets created with and empty list of basket items' do
    expect(subject.basket_items).to eq []
  end

  it 'adds a basket item to the list of basket items' do
    subject.add_item(a_basket_item)
    expect(subject.basket_items).to include(a_basket_item)
  end

  it 'removes a basket item from the list of basket items' do
    subject.add_item(a_basket_item)
    subject.remove_item(a_basket_item)
    expect(subject.basket_items).not_to include(a_basket_item)
  end
end

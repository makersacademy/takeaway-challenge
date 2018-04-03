require 'order_item_printer'

describe OrderItemPrinter do
  
  class DummyClass1
    include OrderItemPrinter
  end

  before(:each) do
    @dummy_class = DummyClass1.new
  end

  it 'pretty prints info about order item' do
    expect(@dummy_class.pretty_print(id: 'A1234', price: 9.80, quantity: 3, dish: 'Fake dish')).to eq 'Order item A1234: Fake dish x 3 : £9.80'
  end
end

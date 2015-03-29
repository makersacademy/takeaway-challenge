require 'takeaway'

context 'Takeaway knows' do
  let(:takeaway) { Takeaway.new }

  before do
    takeaway.customer 'Bob', '07951761165'
  end

  it 'Bob is their customer' do
    expect(takeaway.customer_name).to eq 'Bob'
  end

  it 'Bob\'s number is 07951761165' do
    expect(takeaway.customer_number).to eq '07951761165'
  end

  it 'their menu contains 3 selections' do
    expect(takeaway.menu.count).to eq 3
  end

  it 'meal-small costs 5' do
    expect(takeaway.menu[:"meal-small"]).to eq 5
  end

  it 'meal-medium costs 10' do
    expect(takeaway.menu[:"meal-medium"]).to eq 10
  end

  it 'meal-large costs 15' do
    expect(takeaway.menu[:"meal-large"]).to eq 15
  end
end

context 'Takeaway lets the customer' do
  let(:takeaway) { Takeaway.new }

  it 'view the menu' do
    menu_string = "meal-small: £5\nmeal-medium: £10\nmeal-large: £15\n"
    expect(takeaway.show_menu).to eq menu_string
  end

  it 'order one item' do
    order_1 = { "meal-medium": 1 }
    expect(takeaway.order(order_1)).to eq order_1
  end

  it 'knows the price of ordering 1 item' do
    takeaway.order("meal-medium": 1)
    expect(takeaway.total_price).to eq 10
  end

  it 'order multiple items' do
    order_2 = { "meal-small": 2, "meal-medium": 2, "meal-large": 2 }
    expect(takeaway.order(order_2)).to eq order_2
  end

  it 'knows the price of ordering multiple item' do
    takeaway.order("meal-small": 2, "meal-medium": 2, "meal-large": 2)
    expect(takeaway.total_price).to eq 60
  end

  it 'view their final order before placing it' do
    takeaway.order("meal-small": 1, "meal-medium": 2)
    checkout_msg = "1 x meal-small = £5\n2 x meal-medium = £20\nTotal = £25"
    expect(takeaway.confirm_checkout).to eq checkout_msg
  end
end

context 'Takeawy' do
  let(:takeaway) { Takeaway.new }
  # let(:MessageKlass.new) { double :send_text, true }

  xit 'can text the customer if number and order are given' do
    takeaway.customer 'Bob', '08008881234'
    takeaway.order("meal-small": 1)
    allow(MessageKlass.new).to receive(:send_text).and_return true
    expect(takeaway.delivery_conf).not_to raise_error
  end

  it 'does not text if no customer number or no order' do
    takeaway.customer 'Bob'
    expect { takeaway.delivery_conf }.to raise_error "Error"
  end
end

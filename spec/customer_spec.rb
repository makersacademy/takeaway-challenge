require 'customer'
describe Customer do

  it {is_expected.to respond_to :view_menu}
  it {is_expected.to respond_to :select_dishes}
  it {is_expected.to respond_to :check_total_amount}
  it {is_expected.to respond_to :order_confirmation}

  it 'can view menu' do
    customer = Customer.new
    expect(subject.view_menu).to_not be_empty
  end
  it 'can select dishes' do
    customer = Customer.new
    restaurant = double :restaurant
    subject.select_dishes :Beef_BBQ, 1
    subject.select_dishes :Vegetable, 2
    expect(subject.restaurant.order).to eq [{:Beef_BBQ => 15}, {:Vegetable => 16}, {:Vegetable => 16}]
  end
   it 'can compare the total with the order he/she made' do
    customer = Customer.new
    subject.select_dishes :Beef_BBQ, 1
    subject.select_dishes :Vegetable, 2
    expect(subject.check_total_amount).to eq 47
  end
end
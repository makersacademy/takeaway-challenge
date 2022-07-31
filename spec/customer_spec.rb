require 'customer'

describe Customer do

  it 'tests user can order meals' do
    meal = double(:meal)
    amount = double(:amount)
    subject.customer_order(:meal, :amount)
    expect(subject.order).to eq([{
       :order_amount=>:amount,
       :order_meal=>:meal
    }])
  end

end

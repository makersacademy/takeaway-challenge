require 'takeaway'

describe Takeaway do

  let(:takeaway){Takeaway.new}

  it 'has a menu with a selection of dishes and prices' do
    expect(takeaway.menu["Pizza"]).to eq(8)
  end

  it 'can take an order from the customer with quantity' do
    takeaway.order("Pizza", 2)
    takeaway.order("Burger", 4)
    expect(takeaway.order_list).to eq({"Pizza"=>2, "Burger"=>4})
  end

  it 'knows the total number of dishes ordered' do
    takeaway.order("Pizza", 2)
    takeaway.order("Burger", 4)
    expect(takeaway.number_of_dishes).to eq(6)
  end

  it 'can check order by asking customer to confirm number of dishes' do
    takeaway.order("Sushi", 8)
    takeaway.order("Beer", 4)
    expect(takeaway.confirm_total(12)).to eq("Order confirmed!")
  end

  it 'can check order by asking customer to confirm number of dishes' do
    takeaway.order("Sushi", 8)
    takeaway.order("Beer", 4)
    expect(takeaway.confirm_total(15)).to eq("Wrong number of dishes, please check your order")
  end

end
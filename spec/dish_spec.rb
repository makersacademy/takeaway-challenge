require 'dish'
describe Dish do
  subject = Dish.new("Spaghetti Carbonara", "£8.95")
  it 'has a name' do
    expect(subject.name).to eq("Spaghetti Carbonara")
  end
  it 'has a price' do
    expect(subject.price).to eq("£8.95")
  end
  it 'can be added to an order' do
    order = double("order").as_null_object
    expect(subject.order(order)).to eq("Added to order #{order}")
  end
end

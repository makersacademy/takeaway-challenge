require 'Order'
describe Order do

  it 'gets menu from Menu' do
   expect(subject.menu)
  end

  it 'puts food into order' do
    subject.foodSelection("ChickenPie")
    expect(subject.currentOrder).to eq [{ name:'ChickenPie', price:'5.50'}]
  end

  it 'outputs total food price' do
    subject.foodSelection("ChickenPie")
    subject.foodSelection("LemonTart")
    expect(subject.totalPrice).to eq ("£7.55")
  end

  it 'sends me a text' do
    subject.foodSelection("ChickenPie")
    subject.foodSelection("LemonTart")
    expect(subject.finishOrder).to respond_to
  end
end

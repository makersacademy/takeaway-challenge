require 'takeaway'

describe Takeaway do

  let(:order) { double :order }
  it 'can display a list of dishes with prices' do
    expect(subject.show_menu).to eq({Pizza: 9.99,
      Kebab: 5.00,
      Chips: 2.20})
  end

  it 'add items to an order' do
    subject.add("Pizza")
    expect(subject.order).to include("1x Pizza")
  end
  
end

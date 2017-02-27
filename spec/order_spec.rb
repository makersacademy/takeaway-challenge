require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu)}
  let(:menu) { instance_double("Menu")}
  let(:items) do
    {
      Yum: 1,
      Tasty: 2
    }
  end

  before (:each) do
    allow(menu).to receive(:has_item?).with(:Yum).and_return(true)
    allow(menu).to receive(:has_item?).with(:Tasty).and_return(true)

    allow(menu).to receive(:price).with(:Yum).and_return(1.00)
    allow(menu).to receive(:price).with(:Tasty).and_return(2.00)
  end

  it 'adds items from the menu' do
    order.add_item(:Yum, 1)
    order.add_item(:Tasty, 2)
    expect(order.items).to eq(items)
  end

  it "doesn't allow items to be added unless they are on the menu" do
    allow(menu).to receive(:has_item?).with(:Yuck).and_return(false)
    expect{ order.add_item(:Yuck, 4)}.to raise_error "Selected item is not on the menu"
  end

  it 'calculates the total amount for the order' do
    order.add_item(:Yum, 1)
    order.add_item(:Tasty, 2)
    total_amount = 5.00
    expect(order.total_amount).to eq(total_amount)
  end
  
end

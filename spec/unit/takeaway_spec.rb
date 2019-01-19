require 'takeaway'

RSpec.describe Takeaway do
let(:pieshop) { Takeaway.new('menu.csv') }

  it 'lets you add an order' do
    expect(pieshop.order('Vegetable pie', 1)).to eq [{:item=>"Vegetable pie", :quantity=>1}]
  end

  it 'lets you check the total' do
    pieshop.order('Steak pie', 2)
    expect(pieshop.check_total(6)).to be true
  end

  it 'lets you show the order' do
    expect(pieshop.show_order).to be_a(Array)
  end

  it 'confirms sending of text message when order is complete' do
    expect(pieshop.complete_order).to eq 'Order confirmed! Text sent'
  end
end

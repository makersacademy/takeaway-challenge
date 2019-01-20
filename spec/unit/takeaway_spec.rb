require 'takeaway'

RSpec.describe Takeaway do
  let(:pieshop) { Takeaway.new('menu') }

  it 'lets you add an order' do
    expect(pieshop.order('Vegetable pie', 1)).to eq [{ :item => "Vegetable pie", :quantity => 1 }]
  end

  it 'lets you check the total' do
    pieshop.order('Steak pie', 2)
    expect(pieshop.check_total(6)).to be true
  end

  it 'lets you show the order' do
    pieshop.order('Dog pie', 2)
    expect(pieshop.show_order).to eq [{:item=>"Dog pie", :quantity=>2}]
  end

  xit 'confirms sending of text message when order is complete' do
    expect(pieshop.complete_order).to have_attributes(:error_code => 0)
  end
end

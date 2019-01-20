require 'takeaway'

RSpec.describe Takeaway do
  let(:pieshop) { Takeaway.new('menu') }

  subject { pieshop }

  it 'responds to complete order' do
    is_expected.to respond_to(:complete_order)
  end

  it 'lets you add an order' do
    expect(pieshop.order('Vegetable pie', 1)).to eq [{ :item => "Vegetable pie", :quantity => 1 }]
  end

  it 'lets you check the total' do
    pieshop.order('Steak pie', 2)
    expect(pieshop.check_total(6)).to be true
  end

  it 'lets you show the order' do
    pieshop.order('Dog pie', 2)
    expect(pieshop.show_order).to eq [{ :item => "Dog pie", :quantity => 2 }]
  end

end

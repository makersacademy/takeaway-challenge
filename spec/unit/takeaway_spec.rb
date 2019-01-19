require 'takeaway'

RSpec.describe Takeaway do
let(:pieshop) { Takeaway.new('menu.csv') }

  it 'lets you add an order' do
    expect(pieshop.order('Vegetable pie', 1)).to eq [{"Vegetable pie"=>1}]
  end

  it 'lets you check the total' do
    pieshop.order('Steak pie', 2)
    expect(pieshop.check_total(6)).to be true
  end
end

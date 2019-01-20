require 'takeaway'

RSpec.describe Takeaway do
  let(:pieshop) { Takeaway.new('menu') }

  subject { pieshop }

  it 'responds to complete order' do
    is_expected.to respond_to(:complete_order).with(1).argument
  end

  it 'lets you add an order' do
    expect(pieshop.order('Vegetable pie', 1)).to eq [{ :item => "Vegetable pie", :quantity => 1 }]
  end

  it 'lets you check the total' do
    pieshop.order('Steak pie', 2)
    expect(pieshop.check_total(6)).to be true
  end

  it 'gives an error when total is incorrect' do
    pieshop.order('Steak pie', 2)
    expect{ pieshop.complete_order(9) }.to raise_error "Total incorrect"
  end

  it 'lets you show the order' do
    pieshop.order('Dog pie', 2)
    expect(pieshop.show_order).to eq "item                quantity\nDog pie             2\n"
  end

  it 'prints the menu in a nice format' do
    expect(pieshop.show_menu).to eq "item                price\nVegetable pie       2\nLamb pie            3\nSteak pie           3\nKangaroo pie        4\nDog pie             1\nMonkey pie          5\nWhale pie           6\n"
  end

end

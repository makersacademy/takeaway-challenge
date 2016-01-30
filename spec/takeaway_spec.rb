require 'takeaway'

describe Takeaway do
  let(:menu){ Menu.new ({"soup"=>3.22, "garlic bread"=>1.35, "olives"=>2.86})}
  subject(:takeaway) {described_class.new menu}

  it 'return list of dishes when #see_menu called' do
    expect(takeaway.see_menu).to eq ({"soup"=>3.22, "garlic bread"=>1.35, "olives"=>2.86})
  end

  it 'return order with dish name and 1x (if not specified)' do
    expect(takeaway.order('dish')).to eq '1x dish(s)'
  end

  it 'return order with dish name and quantity' do
    expect(takeaway.order('dish',2)).to eq '2x dish(s)'
  end

  it 'so customer can verify see the selected items' do
    takeaway.order('dish1',2)
    takeaway.order('dish2',3)
    takeaway.order('dish3')
    expect(takeaway.basket).to eq ([{:dish1 => 2},{:dish2 => 3},{:dish3 => 1}])
  end

end
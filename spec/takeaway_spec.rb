require 'takeaway'

describe Takeaway do
  let(:menu){ Menu.new ({"soup"=>3.22, "garlic bread"=>1.35, "olives"=>2.86})}
  subject(:takeaway) {described_class.new menu}

  it 'return list of dishes when #see_menu called' do
    expect(takeaway.see_menu).to eq ({"soup"=>3.22, "garlic bread"=>1.35, "olives"=>2.86})
  end

  it "add dish name and quantity 1x(if not specified) to basket" do
    takeaway.order("soup")
    expect(takeaway.basket).to eq ({"soup"=>1})
  end

  it "add dish name and quantity to basket" do
    takeaway.order("soup",3)
    expect(takeaway.basket).to eq ({"soup"=>3})
  end

  it "add quantity to dish if it is already in the basket" do
    takeaway.order("soup",3)
    takeaway.order("soup")
    expect(takeaway.basket).to eq ({"soup"=>4})
  end

  xit 'so customer can verify see the selected items' do
    takeaway.order('dish1',2)
    takeaway.order('dish2',3)
    takeaway.order('dish3')
    expect(takeaway.basket).to eq ([{:dish1 => 2},{:dish2 => 3},{:dish3 => 1}])
  end

end
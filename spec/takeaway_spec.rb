require 'takeaway'

describe Takeaway do

  let(:menu){ Menu.new({"soup"=>3.22, "garlic bread"=>1.35, "olives"=>2.86})}
  subject(:takeaway) {described_class.new(menu)}

  before do
    allow(takeaway).to receive(:send_sms)
  end

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

  it "remove completely dish from the basket by #correct_order" do
    takeaway.order("soup",3)
    takeaway.correct_order("soup",4)
    expect(takeaway.basket).to be_empty
  end

  it "remove quantity of dish from the basket by #correct_order" do
    takeaway.order("soup",3)
    takeaway.correct_order("soup",2)
    expect(takeaway.basket).to include("soup"=>1)
  end

  it "so customer can verufy the order by see sum of dishes" do
    takeaway.order("soup",3)
    takeaway.order("soup")
    takeaway.order("olives",2)
    message = "soup x4 = £12.88, olives x2 = £5.72"
    expect(takeaway.basket_summary).to eq message
  end

  it "so customer can see total of the order" do
    takeaway.order("soup",3)
    takeaway.order("soup")
    takeaway.order("olives",2)
    expect(takeaway.total).to eq "Total: £18.60"
  end

  it "so customer can #complete_order" do
    final_amount = 20.33
    message = "Thank you! Your order with total price of "
    message += "£#{final_amount} is confirmed and will be "
    message += "delivered to you before #{takeaway.delivery_time}!"
    takeaway.complete_order(final_amount)
  end


end
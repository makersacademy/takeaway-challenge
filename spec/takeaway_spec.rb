require 'takeaway'

describe Takeaway do

  subject(:takeaway){ described_class.new }
  let(:menu){Menu.new}
  let(:order){Order.new}


  it "Should let customers see the menu" do
    expect(takeaway.see_menu).to eq [{:dish=>1, :name=>"kebab", :price=>3},
      {:dish=>2, :name=>"burger", :price=>4},
      {:dish=>3, :name=>"fries", :price=>2},
      {:dish=>4, :name=>"shake", :price=>2.5}]
  end

  it "Should allow customers to see the cost of their order" do
    takeaway.add_to_order(3)
    takeaway.add_to_order(4)
    expect(takeaway.total_cost).to eq "Total price: 4.5"
  end

  it "Should allow customers to choose items from the menu" do
    expect(takeaway.add_to_order(2)).to eq [{:dish=>2, :name=>"burger", :price=>4}]
  end

  before do
    allow(takeaway).to receive(:send_text)
  end

    it 'Sends a delivery confirmation message' do
      delivery = (Time.now + 3600).strftime("%H:%M")
      expect(takeaway).to receive(:send_text).with("Thank you for your order; your food will be delivered by #{delivery}")
      takeaway.send_text("Thank you for your order; your food will be delivered by #{delivery}")
    end

  end

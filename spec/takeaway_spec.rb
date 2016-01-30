require 'takeaway'

describe Takeaway do 

subject(:takeaway) {described_class.new}
  
  describe "#list_menu" do 
 
    it 'displays a list of dishes' do 
    expect(takeaway.list_menu).to include ("Roast Pork Belly Hirata Buns")
    end

  end

  describe "#select_item" do 

    it { should respond_to(:select_item).with(2).arguments }

    it 'allows you to select a dish from the menu' do 
    takeaway.select_item("Roast Pork Belly Hirata Buns")
    expect(takeaway.order).to include ("Roast Pork Belly Hirata Buns")
    end

    it 'allows you to select multple items from the menu' do
    takeaway.select_item("Roast Pork Belly Hirata Buns")
    takeaway.select_item("Salt & Pepper Squid",2)
    takeaway.select_item("Roast Pork Belly Hirata Buns")
    expect(takeaway.order).to eq ["Roast Pork Belly Hirata Buns", "Salt & Pepper Squid", "Salt & Pepper Squid", "Roast Pork Belly Hirata Buns"]
    end
  
    it 'confirms the items you have selected' do 
    expect(takeaway.select_item("Roast Pork Belly Hirata Buns",2)).to eq "you added 2 Roast Pork Belly Hirata Buns to your basket"
    end

  end

  describe "#total" do 

    it { should respond_to(:total) }

    it "sums the price of all the selected items" do
    takeaway = Takeaway.new
    menu = Menu.new
    takeaway.select_item("Roast Pork Belly Hirata Buns")
    takeaway.select_item("Salt & Pepper Squid",2)
    takeaway.select_item("Roast Pork Belly Hirata Buns")
    expect(takeaway.total).to eq "Total cost: £18"
    end

   end


   describe "#order_summary" do 

    it { should respond_to(:order_summary) }

    it "it prints out summed items and a total amount" do
    takeaway = Takeaway.new
    menu = Menu.new
    takeaway.select_item("Roast Pork Belly Hirata Buns")
    takeaway.select_item("Salt & Pepper Squid",2)
    takeaway.select_item("Roast Pork Belly Hirata Buns")
    summary = "Your order summary is:\n 2 x Roast Pork Belly Hirata Buns, £10\n 2 x Salt & Pepper Squid, £8\n Total cost: £18"
    expect(takeaway.order_summary).to include summary
    end
  end

end


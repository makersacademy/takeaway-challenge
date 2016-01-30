require 'takeaway'

describe Takeaway do 

subject(:takeaway) {described_class.new}
let(:dish1) {double(:dish1)} 
let(:dish2) {double(:dish2)} 


  describe "#list_menu" do 
 
    it 'displays a list of dishes' do 
    expect(takeaway.list_menu).to include ("Roast Pork Belly Hirata Buns")
    end

  end

  describe "#select_item" do 

    it { should respond_to(:select_item).with(2).arguments }

    it 'allows you to select a dish from the menu' do 
    takeaway.select_item(dish1)
    expect(takeaway.order).to include (dish1)
    end

    it 'allows you to select multple items from the menu' do
    takeaway.select_item(dish1)
    takeaway.select_item(dish2, 2)
    takeaway.select_item(dish1)
    expect(takeaway.order).to eq [dish1, dish2, dish2, dish1]
    end
  
    it 'confirms the items you have selected' do 
    expect(takeaway.select_item(dish1,2)).to eq "you added 2 #{dish1} to your basket"
    end

  end

  describe "#total" do 

    it { should respond_to(:total) }

    it "sums the price of all the selected items" do
    takeaway.select_item("Roast Pork Belly Hirata Buns")
    takeaway.select_item("Salt & Pepper Squid",2)
    takeaway.select_item("Roast Pork Belly Hirata Buns")
    expect(takeaway.total).to eq "Total cost: £18"
    end

   end


   describe "#order_summary" do 

    it { should respond_to(:order_summary) }

    it "it prints out summed items and a total amount" do
    takeaway.select_item("Roast Pork Belly Hirata Buns")
    takeaway.select_item("Salt & Pepper Squid",2)
    takeaway.select_item("Roast Pork Belly Hirata Buns")
    summary = "Your order summary is:\n 2 x Roast Pork Belly Hirata Buns, £10\n 2 x Salt & Pepper Squid, £8\n Total cost: £18"
    expect(takeaway.order_summary).to include summary
    end
  
  end

  describe "#place_summary" do 

    it { should respond_to(:place_order).with(1).arguments }

   context "if payment amount does not match total amount" do
       
       it "raises an error" do
       allow(takeaway).to receive(:total) {18}
       message = "payment does not match total price, please try again"
       expect{takeaway.place_order(14)}.to raise_error message
       end
    
   end

      context "if payment matches total amount" do
       
       it "sends thank you message" do
       allow(takeaway).to receive(:total) {18}
       allow(takeaway).to receive(:one_hours_time) {"20:00"}
       thank_you_message ="Thank you! Your order was placed and will be delivered before 20:00"
       takeaway.place_order(18)
       expect(takeaway.place_order(18)).to eq thank_you_message
       end
    
   end


   end




end


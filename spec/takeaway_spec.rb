require 'takeaway'

describe Takeaway do 
    describe'#show_menu' do
      it'lists dishes with prices' do
          menu = ["pizza","burger","salad", 5, 4, 2]
        takeaway = Takeaway.new
        expect(takeaway.show_menu).to eq(menu)
        end 
    end 
    describe'#order' do 
      it { is_expected.to respond_to(:order).with(3).arguments }
      it'asks to place an order of items,quantities and total'do 
        takeaway = Takeaway.new
        takeaway.show_menu
        items = ["pizza","burger","salad"]
        quantity = [2,5,1]
        total = 8
        expect(takeaway.order(items,quantity,total)).to eq(true)
        
      end 
      it'raises an error if the total is not correct'do
      takeaway = Takeaway.new
      items = ["pizza","burger","salad"]
      quantity = [2,5,1]
        total = 5
        expect{takeaway.order(items,quantity,total)}.to raise_error 'total is incorrect'
      end 
    end 
end 
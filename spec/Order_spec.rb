require 'Menu'
require 'Order'

describe Order do
    describe "#order_items" do
        it "choose item from menu" do
          subject.select_dish("1. meal1")
          expect(subject.select_dish("1. meal1")).to include("1. meal1") 
        end
    end

end

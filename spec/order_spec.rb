require 'order'

describe Order do
    it "raises error when item is not displayed in menu" do
        expect {subject.add_item('Bread', 2).to raise_error('This item is not on the menu')}
    end

    it "can add add a item on the menu to the order array" do
        subject.add_item('Chips', 2.00)
        expect {subject.order.to include(["Chips", 2.00])}
    end

    it "should print total order" do #need to add test to calculate total order
        expect(subject.total)
    end
end
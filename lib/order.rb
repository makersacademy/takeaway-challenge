class Order


    describe "#initialize" do
        it "should contain a menu on intialize" do
            expect(subject.order_menu).to be_empty
        end
    end

end
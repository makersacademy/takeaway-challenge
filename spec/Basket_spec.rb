require "./lib/Basket"

describe Basket do
    
    it "initialises an basket" do
        bask = Basket.new
        expect(bask).to be_instance_of(Basket)
    end

        
    it "initialises an empty basket" do
        bask = Basket.new
        expect(bask.items.length).to eq 0
    end


    it "Adds item to basket" do
        subject.add_item(:Steak, 1)
        expect(subject.items.length).to eq 1

    end

    it "Gets total amount within basket" do
        subject.add_item(:Steak, 3)

        total = subject.total_basket
        expect(total).to be_instance_of(Hash)

    end


end
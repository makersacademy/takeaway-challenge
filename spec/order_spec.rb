require 'order'

describe Order do
    it "has the fuction for a user to make a new order" do
        expect(subject).to respond_to :make_order
    end

end
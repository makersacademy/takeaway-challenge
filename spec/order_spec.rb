require 'order'

describe Order do
    describe "#order" do
      let(:order) { { :chicken => 2, :chips => 1 } }
        it "stores the order" do
          expect(subject.order(order)).to eq [order]
        end
    end
end
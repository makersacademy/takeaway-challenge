require "order"

describe Order do
    subject(:order) { Order.new }
    it { is_expected.to respond_to(:order, :add, :show_order) }

    context 'When initialized' do
        it "has an empty array" do 
            expect(order.order).to eq []
        end

        it "has a total equal to 0" do
            expect(order).to have_attributes(:total => 0)
        end
    end

    describe '#add' do
        it "adds dish to the order" do
            expect { order.add("1/2 Chicken": 7.95) }.to change { order.order.count }.by(1)
        end

        it "adds to the total dish price" do
            expect { order.add({ "1/2 Chicken": 7.95 }) }.to change { order.total }.by(7.95)
        end
    end

    describe '#show_order' do
        it "returns the order and total" do
            order.add({ "1/2 Chicken": 7.95 }) 
            expect { order.show_order }.to output("1/2 Chicken £7.95\n").to_stdout
        end
    end
end
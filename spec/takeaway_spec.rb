require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double("menu") }
  let(:order) { double("order") }

  it 'can show menu (list of dishes with prices)' do
    allow(takeaway).to receive(:show_menu=)
    message = "Chicken Curry £6.5\nLamb Curry £7\nVegetable Curry £6\n"
    expect { takeaway.show_menu }.to output(message).to_stdout
  end

  it 'can recieve a list of dishes ordered by a customer' do
    allow(order).to receive(:select_dish)
    allow(order).to receive(:dishes).and_return({ :name => "Chicken Curry", :quantity => 1 })
    allow(order).to receive(:available?).and_return(true)
    allow(order).to receive(:total_cost).and_return(13.50)
    order.select_dish("Chicken Curry", 1)
    takeaway.place(order)
    expect(takeaway.ordered_dishes).to eq({ :name => "Chicken Curry", :quantity => 1 })
  end

  it 'return the total cost of the order' do
    allow(order).to receive(:select_dish)
    allow(order).to receive(:dishes).and_return({ :name => "Chicken Curry", :quantity => 1 })
    allow(order).to receive(:available?).and_return(true)
    allow(order).to receive(:total_cost).and_return(13.50)
    order.select_dish("Chicken Curry", 1)
    expect(takeaway.place(order)).to eq 13.50

  end
end

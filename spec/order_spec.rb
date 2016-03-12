require 'order'

describe Order do

  subject(:order){described_class.new(order_line_class: order_line_class, customer: customer)}
  let(:customer){double :Customer, name: "customer", mobile: "07474 791111"}
  let(:order_line_class){double :OrderLine, new: order_line}
  let(:order_line){double :order_line, dish: nil, qty: nil, total: nil}


  let(:curry){double :Dish, name: "Curry", price: 16}
  let(:chili){double :Dish, name: "Chili", price: 2}
  let(:chips){double :Dish, name: "Chips", price: 4}
  let(:salad){double :Dish, name: "Salad", price: 8}

  it{is_expected.to respond_to(:add, :total, :finalise, :items)}

  describe '#add' do
    before do
      allow(order_line).to receive(:dish).and_return("Curry")
      allow(order_line).to receive(:qty).and_return(2)
      allow(order_line).to receive(:total).and_return(32)
      order.add(curry, 2)
    end

    context 'add single item' do
      it {expect(order.items).to include(order_line)}
      it {expect(order.total).to eq (32)}
    end

    context 'total after add multiple items' do
      before do
        allow(order_line).to receive(:dish).and_return("Chips")
        allow(order_line).to receive(:qty).and_return(3)
        allow(order_line).to receive(:total).and_return(12)
        order.add(chips, 3)
      end
      it {expect(order.total).to eq (44)}

    end
  end

end

require 'order'

describe Order do

  subject(:order) { described_class.new(dbl_menu, dbl_printer, dbl_texter) }
  let(:dbl_dish) { double :dish,
    print: 'Samosa, £1.0',
    price: 1.0
  }
  let(:dbl_menu) { double :menu,
    select: dbl_dish,
    print: "1. Samosa, £1.0\n"
   }
   let(:dbl_menu2) { double :menu,
     select: dbl_dish,
     print: "1. Bhaji, £2.0\n"
    }
  let(:dbl_printer) { double :dish_printer }
  let(:dbl_texter) { double :texter, send: nil }

  it 'messages menu to print when asked to show menu' do
    expect(dbl_menu).to receive(:print).with(any_args)
    order.show_menu
  end

  it 'messages dish printer to print when asked to show order' do
    expect(dbl_printer).to receive(:print).with(any_args)
    order.show_order
  end

  it 'lets you add dishes to your order' do
    order.add_dish(1,1)
    order.add_dish(1,1)
    expect(order.order_dishes).to eq [dbl_dish, dbl_dish]
  end

  it 'calculates the price' do
    order.add_dish(1,1)
    order.add_dish(1,1)
    expect(order.total).to eq 2.0
  end

  it 'completes the order' do
    expect{ order.complete }.to change{order.completed}.from(false).to(true)
  end

  it 'messages texter to send message when order is completed' do
    expect(dbl_texter).to receive(:send).with(any_args)
    order.complete
  end

  it 'formats the text message body properly' do
    allow(Time).to receive(:now).and_return(Time.mktime(0))
    expect(order.text_body).to eq "Thank you! Your order was placed and will "\
    "be delivered before 01:00"
  end

  it "doesn't let you add dishes after order is completed" do
    order.complete
    expect{order.add_dish(1,1)}.to raise_error('Items cannot be added after order is completed!')
  end

  it 'allows a difference menu to be selected' do
    expect{ order.change_menu(dbl_menu2) }.to change{order.menu}.from(dbl_menu).to(dbl_menu2)
  end

end

require 'order'
require 'stringio'

describe Order do
  let(:menu) do
    double :menu,
    menu: [{dish: 'BBQ',       price: 10},
           {dish: 'Hamburger', price: 8},
           {dish: 'Pizza',     price: 9},
           {dish: 'Pasta',     price: 7},
           {dish: 'Sushi',     price: 6}]
  end
  describe "#greet" do
    it "greets to the customer" do
      expect { subject.greet }.
        to output("Thank you for visiting our takeaway website.\n" <<
          "please take a look at our menu.\n").to_stdout
    end
  end
  describe "#choose_dish" do
    it "asks customer to choose a menu item number" do
      allow(subject).to receive(:gets).and_return('2')
      expect(subject.choose_dish).to eq(2)
    end
  end

  describe "#choose_how_many" do
    it "asks customer to choose how many dishes he/she wants" do
      allow(subject).to receive(:gets).and_return('1')
      expect(subject.choose_how_many).to eq(1)
    end
  end

  it "remembers my order" do
    allow(subject).to receive(:gets).and_return('4')
    subject.choose_dish
    allow(subject).to receive(:gets).and_return('2')
    subject.choose_how_many
    expect(subject.cart(menu)).
      to eq([{dish: 'Pasta', price: 7, quantities: 2 }])
  end

  it "can check orders" do
    allow(subject).to receive(:gets).and_return('3')
    subject.choose_dish
    allow(subject).to receive(:gets).and_return('3')
    subject.choose_how_many
    subject.cart(menu)
    width = 10
    expect { subject.check_orders }.
      to output(("Dish".ljust(width) << "Quantities".center(width) <<
        "Price".center(width) << "Total".rjust(width) + "\n" <<
          "Pizza".ljust(width) << "3".center(width) + "9".center(width) <<
            "27".rjust(width) + "\n" << "The total price is 27\n")).to_stdout
  end
  it "executes orders" do
    allow(subject).to receive(:gets).and_return('4')
    subject.choose_dish
    allow(subject).to receive(:gets).and_return('2')
    subject.choose_how_many
    subject.cart(menu)
    expect(subject.execute_orders.first[:paid]).to be true
  end
end

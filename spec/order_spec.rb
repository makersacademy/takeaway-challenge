require 'order'
require 'stringio'

describe Order do
  describe "#greet" do
    it "greets to the customer" do
      expect { subject.greet }.to output("Thank you for visiting our takeaway website.\nplease take a look at our menu.\n").to_stdout
    end
  end
  describe "#choose_dish" do
    # it "prints out a question asking customer to choose a dish" do
    #   expect { subject.choose_dish }.to output("What would you like to order? Please enter a menu item number.\n").to_stdout
    # end
    it "asks customer to choose a menu item number" do
      $stdin = StringIO.new('2')
      expect(subject.choose_dish).to eq(2)
    end
  end

  describe "#choose_how_many" do
    # it "prints out a question asking how many dishes customer wants" do
    #   expect { subject.choose_how_many(:bbq) }.to output("How many of dishes do you want?\n").to_stdout
    # end
    it "asks customer to choose how many dishes he/she wants" do
      $stdin = StringIO.new('1')
      expect(subject.choose_how_many(:bbq)).to eq(1)
    end
  end

  it "remembers my order" do
    menu = Menu.new
    $stdin = StringIO.new('4')
    subject.choose_dish
    $stdin = StringIO.new('2')
    subject.choose_how_many(menu)
    expect(subject.cart(menu)).to eq([{ pasta: 8, quantities: 2 }])
  end

  # it "can check my orders" do
  #   menu = Menu.new
  #   $stdin = StringIO.new('4')
  #   subject.choose_dish
  #   $stdin = StringIO.new('2')
  #   subject.choose_how_many(menu)
  #   $stdin = StringIO.new('3')
  #   subject.choose_dish
  #   $stdin = StringIO.new('3')
  #   subject.choose_how_many(menu)
  #   expect(subject.check_orders).to output().to_stdout
  # end



end

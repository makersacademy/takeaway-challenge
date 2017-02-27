require 'order'

describe Order do
  subject(:order) {described_class.new}

  it "raises an error if incorrect item number is selected" do
    expect{order.choose_dishes([6, 2], 3)}.to raise_error "No such item on menu. Please re-order."
  end

  it "prints the order to the screen" do
    expect{order.choose_dishes([1, 2], [2, 2], 15)}.to output("2 x Tandoori Chicken = 7.0\n2 x Lamb Madras = 8.0\nTotal = 15.0\nIs this correct? (y | n)\n").to_stdout
  end

  it "raises an error if the user selects incorrectly" do
    expect{order.choose_dishes([3000, 2], [2, 2], 15)}.to raise_error "No such item on menu. Please re-order."
  end

end

require 'takeaway'

describe Takeaway do

  it '#dishes returns a list of dishes and prices' do
    expect(
      subject.dishes
    ).to include(dish: 'Fish and chips', price: 8)
  end

  it '#print_dishes prints dishes and prices to screen' do
    expect {
      subject.print_dishes
    }.to output(
      "1. Fish and chips: £8\n2. Paella: £10\n"
    ).to_stdout
  end

  it '#choose_order allows choosing dishes' do
    expect(
      subject.choose_order(1)
    ).to include(dish: 'Fish and chips', price: 8)
  end
end

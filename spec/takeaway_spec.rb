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
      "Fish and chips: £8\nPaella: £10\n"
    ).to_stdout
  end
end

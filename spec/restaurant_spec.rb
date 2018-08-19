require 'restaurant'

describe Restaurant do

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


end

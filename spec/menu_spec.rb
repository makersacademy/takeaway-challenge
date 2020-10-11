require 'menu'

describe Menu do
  it 'stores a list of food and their prices' do
    expect(subject.list).to eq({"hamburger" => 0.99, "chicken nuggets" => 2.99, "double cheeseburger" => 1.99, "fries" => 1.29, "milkshake" => 2.09 })
  end

  it 'prints a prettified list of food and their prices' do
    expect{subject.prettify_list}.to output("hamburger: £0.99\nchicken nuggets: £2.99\ndouble cheeseburger: £1.99\nfries: £1.29\nmilkshake: £2.09\n").to_stdout
  end
end

require 'menu'

describe Menu do
  it 'stores a list of food and their prices' do
    expect(subject.menu_list).to eq({"hamburger" => 1.99, "chicken nuggets" => 2.99, "double cheeseburger" => 1.99, "fries" => 1.29, "milkshake" => 2.09 })
  end

  it 'prints a prettified list of food and their prices' do
    expect{subject.prettify_menu_list}.to output("Hamburger: £1.99\nChicken nuggets: £2.99\nDouble cheeseburger: £1.99\nFries: £1.29\nMilkshake: £2.09\n").to_stdout
  end
end

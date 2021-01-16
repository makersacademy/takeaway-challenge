require "menu"

describe Menu do

  let(:dish) { double(name: "Naan", price: 195) }

  it "stores dishes" do
    subject.add_dish(dish)
    expect(subject.dishes_list).to include dish
  end

  it "lists dishes" do
    subject.add_dish(dish)
    expect { subject.print_dishes }.to output(/#{Regexp.quote(dish.name)}/).to_stdout
  end
  
end
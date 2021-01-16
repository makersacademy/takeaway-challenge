require "menu"

describe Menu do

  let(:dish) { double(name: "Naan", price: 195) }
  let(:dish2) { double(name: "Rice", price: 350) }
  let(:order) { double(total_price: 1500) }

  it "stores dishes" do
    subject.add_dish(dish)
    expect(subject.dishes_list).to include dish
  end

  it "loads in a file to create many dishes" do
    file = "./lib/menu.csv"
    expect { subject.load_menu(file) }.to change { subject.dishes_list.length }
  end

  it "lists dishes" do
    subject.add_dish(dish)
    expect { subject.print_dishes(subject.dishes_list) }.to output(/#{Regexp.quote(dish.name)}/).to_stdout
  end

end

require 'restaurant'

describe Restaurant do
  it "can show a menu" do
    menu = double("menu")
    expect { subject.see_menu }.to output { menu.print_menu }.to_stdout
  end

  # it "can #place_order" do
  #   subject.place_order("Milkshake", 1)
  #   expect(subject.current_order).to include("Cheese Burger")
  # end

  it "can #get_ticket" do
    order = double("order")
    expect { subject.close_ticket }.to output { order.finish_order }.to_stdout
  end
end

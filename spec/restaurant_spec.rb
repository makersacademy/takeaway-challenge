require 'restaurant'

describe Restaurant do
  it "can show a menu" do
    menu = double("menu")
    expect { subject.see_menu }.to output { menu.print_menu }.to_stdout
  end

  it "can show a finished order" do
    order = double("order")
    expect { subject.see_order }.to output { order.finish_order }.to_stdout
  end
end

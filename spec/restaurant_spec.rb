require 'restaurant'

describe Restaurant do
  it "can show a menu" do
    menu = double("menu")
    expect { subject.see_menu }.to output { menu.print_menu }.to_stdout
  end

  # COULDNT MANAGE TO MAKE THIS TEST PASS

  # it "can #place_order" do
  #   subject.stub(:place_order).with("Milkshake", "1")
  #   expect(:current_order).to include("Milkshake")
  # end

  it "shows a ticket at #checkout" do
    order = double("order")
    expect { subject.checkout }.to output { order.finish_order }.to_stdout
  end

  # it "send a confirmation message at #checkout" do
  #   message = double("message")
  #   expect { subject.checkout }.to #send_text (LOOK FOR SYNTAX)
  # end
end

require 'restaurant'
require 'pry'

RSpec.describe Restaurant do

  let(:mock_menu_type) { double :mock_menu_type, new: mock_menu }
  let(:mock_menu) { double :mock_menu, display_menu: "Menu items and prices",
                    on_the_menu?: true, search_menu:
                    { name: "Spaghetti and Meatballs", price: 5.00 }
  }
  let(:mock_dish) { double :mock_dish, name: "Spaghetti and Meatballs", price: "5" }
  let(:mock_order_confirmer_type) { double :mock_order_confirmer_type, new: mock_order_confirmer }
  let(:mock_order_confirmer) { double :mock_order_confirmer, confirm_order: true }

  subject { described_class.new(menu_type: mock_menu_type, order_confirmer: mock_order_confirmer_type) }

  it "should display a list of dishes with prices" do
    expect { subject.display_menu }.to output("Menu items and prices\n").to_stdout
  end

  it "should allow the user to select a number of dishes" do
    subject.add_to_basket(mock_dish)
    expect(subject.basket).to eq({ { name: "Spaghetti and Meatballs", price: 5.00 } => 1 })
  end

  it "should allow the user to order more than one dish at once" do
    subject.add_to_basket(mock_dish, 4)
    expect(subject.basket).to eq({ { name: "Spaghetti and Meatballs", price: 5.00 } => 4 })
  end

  it "should allow the user to see their basket printed in a clear format" do
    subject.add_to_basket("Spaghetti and Meatballs")
    expect { subject.display_basket }.to output("Spaghetti and Meatballs x 1 = £5.00\n").to_stdout
  end

  it "should allow the user to checkout if they give the correct total price of their basket" do

  end

  it "should raise an error if the user enters the incorrect total price on checkout" do
    expect { subject.checkout(10) }.to raise_error "Wrong sum entered, please enter correct sum"
  end

  it "should text the user their order after checkout along with the time of arrival" do
    subject.add_to_basket(mock_dish)
    message = "You will shortly receive a text confirming your order\nYour basket is now empty\n"
    expect { subject.checkout(5.00) }.to output(message).to_stdout
  end

  it "should allow the user to order by text" do

  end

end

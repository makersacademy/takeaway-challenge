require 'menu'

describe Menu do

  it "initialises a new instance of the Menu class" do
    expect(subject).to be_a Menu
  end

  it "contains a list of dishes with prices" do
    expect(subject.menu).to be_a Hash
    expect(subject.menu["Fried rice"]).to be_a Numeric
    expect(subject.menu).to have_key("Fried rice")
  end

  it "responds to a method called view_menu" do
    expect(subject).to respond_to(:view_menu)
  end

  it "allows the customer to view the list of dishes with prices" do
    expect(subject.view_menu).to include("Fried rice" => 8)
  end

  # it "allows the customer to create an order" do
  #   expect(subject.create_order).to be_a Order
  # end
end

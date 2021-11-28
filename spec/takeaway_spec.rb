require 'takeaway'

describe Takeaway do

  it "creates a menu" do

    expect(subject.menu).to be_instance_of(Hash)
  end

  it "lets you add an item to the menu" do
    subject.add_item("Chicken",7)
    expect(subject.menu["Chicken"]).to eq 7
  end

  it "lets you see the menu" do
    menus = subject.menu
    expect(subject.see_menu).to eq menus
  end

  it "Lets you add a item to your choices" do
    subject.add_item("Chicken",7)
    subject.choose_dish("Chicken")
    expect(subject.my_choices).to include("Chicken")
  end

  it "Won't let you add an item not on the menu" do
    subject.choose_dish("Chicken")
    expect(subject.my_choices).not_to include("Chicken")
  end


  it "Can calculate the total of a number of dishes" do
    subject.choose_dish("Bryani")
  end

  it "Allows you to complete your order" do
    subject.choose_dish("Bryani")
    expect(subject.make_order).to eq("Bryani,7")

  end

  it "Sends a message to Twilio to send a text" do
    expect(subject).to respond_to(:send_text)
  end

end
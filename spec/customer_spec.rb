require 'customer'

describe Customer do
  it "Can get customer name" do
    expect(subject.get_name).to eq subject.name
  end

  it "Can get customer phone number" do
    expect(subject.get_phone).to eq subject.phone_number
  end

  it "can display menu" do
    menu_display = subject.see_menu
    expect(menu_display["hamburger"]).to eq 6
  end

  it "Raises error if dish is not on menu" do
    subject.selection = "Spaghetti"
    expect{ subject.get_food }.to raise_error "That dish is not on the menu!"
  end

  it "Can get the total of the order" do
    expect(subject).to respond_to(:get_total)
  end

end

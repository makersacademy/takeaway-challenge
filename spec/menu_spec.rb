require "menu"

describe Menu do

  it "can return the value of hash in items" do
    expect(subject.print_menu).not_to be_empty
  end


end
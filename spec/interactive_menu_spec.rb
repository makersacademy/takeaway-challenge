require 'interactive_menu'

describe InterMenu do
  subject { Intermenu.new }

  it "should allow customer to view food menu" do
    customer_selection = 1
    expect(subject.menu_option).to eq(Menu.new)
  end
end

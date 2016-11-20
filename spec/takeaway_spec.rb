require 'takeaway'

describe TakeAway do
  subject(:takeaway) {described_class.new}

  it "should show the menu list" do
    menu_list = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
    expect(takeaway.read_menu).to eq menu_list
  end

end

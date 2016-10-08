require 'menu'

describe Menu do
 subject { described_class.new }

  it "has a list of dishes and prices" do
    expect(subject.list).to eq Menu::VEGETARIAN_MENU
  end

 it "prints the list of dishes and prices" do
   content = "Thai_green_curry -- £9\nAubergine_teriyaki -- £9\nMushroom_risotto -- £8\n"
   expect{subject.print_menu}.to output(content).to_stdout
 end
end

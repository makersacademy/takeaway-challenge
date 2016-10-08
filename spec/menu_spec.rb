require 'menu'

describe Menu do
 subject { described_class.new }

  it "has a list of dishes and prices" do
    expect(subject.list).to eq Menu::VEGETARIAN_MENU
  end

 it "prints the list of dishes and prices" do
     formatted_menu = "Thai_green_curry                                £9\nAubergine_teriyaki                              £9\nMushroom_risotto                                £8\nButternut_rotolo                                £9\nThali                                          £11\nSmoky_bean_burger                               £7\n"
   expect{subject.print_menu}.to output(formatted_menu).to_stdout
 end
end

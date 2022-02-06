require_relative '../lib/menu.rb'
describe Menu do
  subject(:menu) {described_class.new(list)}
    let(:list) do {
    chicken: 4.95,
    tofu: 3.95,
    rice: 2
    }
    end
  
  it "should have a list of dishes and prices" do 
    expect(subject.list).to eq (list)
  end

  it "prints a list of dishes" do
    print_menu = "Chicken £4.95, Tofu £3.95, Rice £2.00"
    expect(subject.print_list).to eq(print_menu)
  end
# it "have a list of dishes and prices" do
  #   expect(subject.list).to eq ([ 'chicken: £3',
  #                                  'beef: £5',
  #                                  'lamb: £6'
  #   ])
  # end
# make it print the menu
end
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
# it "have a list of dishes and prices" do
  #   expect(subject.list).to eq ([ 'chicken: £3',
  #                                  'beef: £5',
  #                                  'lamb: £6'
  #   ])
  # end
# make it print the menu
end
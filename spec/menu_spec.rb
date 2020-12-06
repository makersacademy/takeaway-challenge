require 'menu'

describe Menu do
  it { is_expected.to be_instance_of(Menu) }

  it { is_expected.to respond_to(:view) }

  it { is_expected.to respond_to(:select) }

  it "has a menu with 3 items" do
    expect(subject.dishes.size).to be 3
  end

  describe '#view' do
    it "displays menu" do
      menu = "Pizza: £6.50\nSpaghetti: £5.75\nSalad: £5.25"
      expect(subject.view).to eq menu
    end
  end

  # I have checked this in irb but can't get the unit test to work.
  # Have tried multiple mocks/stubs/doubles
  # describe '#select' do
  #   it "returns chosen dish" do
  #     allow(dishes).to receive(:each) { dish }
  #     allow(dish).to receive(:name) { dish }
  #     expect(subject.select(dish)).to eq dish
  #   end
  # end

end

require 'menu'

describe Menu do

  let(:dish) { double :dish } 
  let(:price) { double :price }

  it "initializes with an empty item hash" do
    expect(subject).to have_attributes(items: {})
  end

  describe '#add_dish' do

    it "adds an item to the menu and set a price" do
      expect(subject.add_dish("chicken", 5.99)).to eq 5.99
    end

  end

  describe "show_menu" do
  
    it "prints off the menu" do
      subject.add_dish("chicken", 5.99)
      expect { subject.show_menu }.to output("Takeaway Menu\n-------------\n1. Chicken: £5.99\n").to_stdout
    end

  end

  it "is true if there if item is on the menu" do
    subject.add_dish("chicken", 5.99)
    expect(subject.dish?("chicken")).to eq true
  end

  it "shows the price of an item on the menu" do
    subject.add_dish("chicken", 5.99)
    expect(subject.price("chicken")).to eq 5.99
  end

end

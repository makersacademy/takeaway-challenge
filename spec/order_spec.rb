require 'order'

describe Order do

  let(:Order) { Order.new }
  let(:dish) { double :dish }

  it 'successfully creates instance of class' do
    expect(subject).to be_instance_of(Order)
  end

  it 'responds to method for adding dishes to order' do
    expect(subject).to respond_to(:add).with(2).arguments
  end

  describe 'add' do
    it 'adds dishes to the current order array' do
      subject.add("chicken", 2)
      expect(subject.current_order).to eq [{ :chicken => 2 }]
    end

    it 'Error if item not on the menu' do
      choice = "human"
      expect { subject.add choice }.to raise_error "Please select something from the menu"
    end

  end

  it 'responds to checkout method' do
    expect(subject).to respond_to(:checkout)
  end

  describe 'checkout' do

    it 'fills the basket with orders' do
      subject.current_order = [{ :chicken => 2 }]
      expect { subject.checkout }.to change { subject.basket }.from([]).to(["chicken, X 2 "])
    end

    it 'stores prices of all ordered dishes in receipt' do
      subject.current_order = [{ :chicken => 2 }]
      expect { subject.checkout }.to change { subject.receipt }.from([]).to([9.0])
    end

  end

  it 'responds to print_basket method' do
    expect(subject).to respond_to(:print_basket)
  end

  describe 'print_basket' do

    it 'prints total with basket' do
      expect(subject.print_basket).to include("Total to pay:")
    end

  end

  it 'responds to total method' do
    expect(subject).to respond_to(:total)
  end

end

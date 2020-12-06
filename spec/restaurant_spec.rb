require 'restaurant'

describe Restaurant do 
  it 'can create an instance of Restaurant' do
    expect(subject).to be_kind_of(Restaurant)
  end

  it 'responds to the method .list' do
    expect(subject).to respond_to(:list_menu)
  end

  it 'responds to the method .order' do
    expect(subject).to respond_to(:order).with(2).argument
  end

  it 'responds to the method .total_basket' do 
    expect(subject).to respond_to(:total_basket)
  end

  it 'responds to method .total_price' do
    expect(subject).to respond_to(:total_price)
  end

  describe '#order(dish,quantity)' do
    it 'adds the order to the basket' do
        subject.order('Margarita', 2)
        expect(subject.basket).to include({'Margarita' => 2})
    end
  end 

  describe '#total_basket' do
    it 'can total multiple orders into one basket' do
    subject.order('Margarita', 2)
    subject.order('Bufala', 10)
    expect(subject.total_basket).to include({'Margarita' => 2, 'Bufala' => 10})
    end
  end

#   describe '#total_price' do
#     it 'can total the price of multiple orders' do
#     subject.order('Margarita', 2)
#     subject.order('Bufala', 10)

#   end 

end 

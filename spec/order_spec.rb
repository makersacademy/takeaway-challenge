require 'order'

describe Order do

  let(:menu_double) { double(:menu_double, :view_menu => [{:cod => 8.25}]) }
  let(:cod) { "Cod" }
  let(:chips) { "Chips" }
  let(:three_cods) {{"Cod" => 3}}

  it 'should contain an empty order by default' do
    expect(subject.basket).to eq({})
  end

  it 'should be initialised with an optional menu' do
    order = Order.new(menu_double)
    expect(order.menu).to eq menu_double
  end

  it 'should allow a given number of items to be added to the basket' do
    subject.add(cod, 3)
    expect(subject.basket).to eq three_cods
  end

  it 'should not add invalid items to the basket' do
    subject.add(cod)
    subject.add(chips)
    subject.add("lamp", 4)
    expect(subject.basket.count).to eq 2
  end

  context 'pricing' do

    it 'should initialise with a zero total' do
      expect(subject.order_total).to eq 0
    end
  
    it 'should return the formatted total' do
      subject.add(cod)
      subject.add(chips)
      subject.add("Gravy")
      expect(subject.total).to eq "£13.15"
    end

    it 'should return the unformatted total' do
      subject.add(cod)
      subject.add(chips)
      subject.add("Gravy")
      expect(subject.finalise).to eq 13.15
    end

  end

end
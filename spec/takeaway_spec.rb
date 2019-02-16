require 'takeaway'

describe Takeaway do

  it 'has a set menu with prices' do
    expect(subject.menu).to include({ dish: 'ceviche', price: 10 },
      { dish: 'causa', price: 9 },
      { dish: 'chicharron', price: 11 },
      { dish: 'anticucho', price: 12 },
      { dish: 'empanada', price: 6 },
      { dish: 'yuca', price: 5 },
      { dish: 'cancha', price: 3 },
      { dish: 'helado', price: 5 },
      { dish: 'alfajor', price: 3 },
      { dish: 'picarones', price: 7 }
    )
  end

  it 'shows the list of dishes with prices' do
    expect(subject.show_menu).to include({ dish: 'ceviche', price: 10 },
      { dish: 'causa', price: 9 },
      { dish: 'chicharron', price: 11 },
      { dish: 'anticucho', price: 12 },
      { dish: 'empanada', price: 6 },
      { dish: 'yuca', price: 5 },
      { dish: 'cancha', price: 3 },
      { dish: 'helado', price: 5 },
      { dish: 'alfajor', price: 3 },
      { dish: 'picarones', price: 7 }
    )
  end

  it 'can select a dish' do
    subject.order('ceviche')
    expect(subject.ordered).to include({ :dish => "ceviche", :price => 10 })
  end

  it 'can store multiple dishes' do
    subject.order('ceviche')
    subject.order('alfajor')
    expect(subject.ordered).to include({ :dish => "ceviche", :price => 10 },
      { :dish => "alfajor", :price => 3 }
    )
  end

  it 'tells the total price of the order' do
    subject.order('ceviche')
    subject.order('alfajor')
    expect(subject.total_price).to eq 13
  end

  it 'tells you the quantity' do
    subject.order('ceviche')
    subject.order('ceviche')
    subject.order('ceviche')
    expect(subject.quantities).to eq([[{ :dish => "ceviche", :price => 10 }, 3]])
  end

end

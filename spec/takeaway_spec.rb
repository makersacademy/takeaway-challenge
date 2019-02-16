require 'takeaway'

describe Takeaway do
  it { is_expected.to respond_to(:order) }
  it { is_expected.to respond_to(:correct?) }
  it { is_expected.to respond_to(:total) }
  it { is_expected.to respond_to(:send_txt) }

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
end

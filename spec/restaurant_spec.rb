require 'restaurant'

describe Restaurant do
  subject { [{ name: "Boneless Spare Ribs", price: 9 }] }
  it 'shows a menu' do
    expect(subject).to eq ([{ name: "Boneless Spare Ribs", price: 9 }])
  end
end

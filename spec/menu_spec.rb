require 'menu'

describe Menu do

  let(:biriyani){double :biriyani, title: "Biriyani", price: 5.00}

  it 'can have dishes added to it' do
    subject.add_dish(biriyani)
    expect(subject.dishes).to include biriyani
  end
end
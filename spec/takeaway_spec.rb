require './lib/takeaway'

describe Takeaway do
  alias_method :takeaway, :subject
  let(:dishes) { Takeaway::DISHES }

  it 'creates instance of Takeaway class' do
    expect(takeaway).to eq(takeaway)
  end

  it 'has a list of dishes stored as constant' do
    expect(takeaway.list_of_dishes).to eq dishes
  end

end

require './lib/takeaway'

describe Takeaway do
  alias_method :takeaway, :subject

  it 'creates instance of Takeaway class' do
    expect(takeaway).to eq(takeaway)
  end
  
end

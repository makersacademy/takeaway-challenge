require 'takeaway'

feature 'Feature test' do
  let(:takeaway) { Takeaway.new }

  before do
    takeaway.customer('Bob', '07951761165')
  end

  scenario 'Takeaway knows customer\s name' do
    expect(takeaway.customer_name).to eq 'Bob'
  end

  scenario 'Takeaway knows customer\s number' do
    expect(takeaway.customer_number).to eq '07951761165'
  end
end

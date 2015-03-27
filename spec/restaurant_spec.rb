require 'restaurant'

describe Restaurant do
  it 'can list all dishes' do
    expect(subject.dishes).to eq(chicken: '£1', fish: '£1')
  end
  it 'can create orders' do
    expect_any_instance_of(Order).to receive(:chicken).with(3)
    subject.order(:chicken, 3)
  end
end
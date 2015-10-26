shared_examples_for Message do
  it 'sets delivery time' do
    expect(subject.delivery_time).to eq(Time.new)
  end

end

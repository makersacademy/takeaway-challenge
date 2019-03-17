require 'text_creator'
describe TextCreator do
  let(:time) { double :time }
  it { is_expected.to respond_to(:time_limit) }

  it 'returns a time in one hour' do
    new_text = TextCreator.new(time)
    allow(time).to receive(:hour).and_return(0)
    allow(time).to receive(:min).and_return(0)
    expect(new_text.time_limit).to eq("1:0")
  end

  it { is_expected.to respond_to(:text) }

  it 'returns a text with time limit' do
    new_text = TextCreator.new(time)
    allow(time).to receive(:hour).and_return(0)
    allow(time).to receive(:min).and_return(0)
    expect(new_text.text).to eq("Thank you! Your order was placed and will be delivered before 1:0")
  end
end

require 'text'

describe Text do
  it 'exists!' do
    expect(subject.class).to eq Text
  end

  it { is_expected.to respond_to(:confirmation) }

  it 'sends a text to confirm' do
    expect(subject).to receive(:confirmation)
    subject.confirmation
  end
end

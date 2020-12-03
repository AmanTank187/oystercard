require 'station'

describe Station do
  subject {described_class.new("Waterloo", 2)}
  it 'It should be an instance of station class' do
    expect(subject).to be_instance_of (Station)
  end

  it 'It knows the name of the station' do
    expect(subject.name).to eq "Waterloo"
  end

  it 'It knows the zone of the station' do
    expect(subject.zone).to eq 2
  end
end

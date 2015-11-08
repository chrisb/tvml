require 'spec_helper'

describe TVML::Template::Alert do
  it 'should dump all elements to XML when rendered' do
    subject.title       = 'RSpec Alert'
    subject.description = 'Tests are green, sir!'
    subject.buttons << 'OK' << 'Cancel'
    expect(subject.build).to eq("<alertTemplate><description>Tests are green, sir!</description><title>RSpec Alert</title><button><text>OK</text></button><button><text>Cancel</text></button></alertTemplate>")
  end
  it 'can have no buttons' do
    subject.title       = 'RSpec Alert'
    subject.description = 'Tests are green, sir!'
    expect(subject.build).to eq("<alertTemplate><description>Tests are green, sir!</description><title>RSpec Alert</title></alertTemplate>")
  end
  it 'can have no elements' do
    expect(subject.build).to eq("<alertTemplate></alertTemplate>")
  end
end

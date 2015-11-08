require 'spec_helper'

describe TVML::Template::Alert do
  it 'should dump all elements to XML when rendered' do
    subject.title       = 'RSpec Alert'
    subject.description = 'Tests are green, sir!'
    subject.buttons << 'OK' << 'Cancel'
    expect(subject.build).to eq("<alertTemplate><description>Tests are green, sir!</description><title>RSpec Alert</title><button><text>OK</text></button><button><text>Cancel</text></button></alertTemplate>")
  end
  it 'can have no elements' do
    expect(subject.build).to eq("<alertTemplate></alertTemplate>")
  end

  context 'buttons' do
    let(:button_obj) { b = TVML::Element::Button.new ; b.text = 'Button' ; b }
    it 'can have no buttons' do
      subject.title       = 'RSpec Alert'
      subject.description = 'Tests are green, sir!'
      expect(subject.build).to eq("<alertTemplate><description>Tests are green, sir!</description><title>RSpec Alert</title></alertTemplate>")
    end
    it 'can build buttons from strings' do
      subject.buttons << 'OK' << 'Cancel'
      expect(subject.build).to eq("<alertTemplate><button><text>OK</text></button><button><text>Cancel</text></button></alertTemplate>")
    end
    it 'can accept button elements' do
      subject.buttons << button_obj << button_obj
      expect(subject.build).to eq("<alertTemplate><button><text>Button</text></button><button><text>Button</text></button></alertTemplate>")
    end
    it 'can use both strings and button elements' do
      subject.buttons << 'String' << button_obj
      expect(subject.build).to eq("<alertTemplate><button><text>String</text></button><button><text>Button</text></button></alertTemplate>")
    end
  end
end

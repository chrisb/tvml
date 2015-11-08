require 'spec_helper'

describe TVML::Document do
  it 'can build a document' do
    subject.template = TVML::Template::Alert.new.tap do |alert|
      alert.title = "Hello World"
      alert.description = "How are things?"
    end
    expect(subject.build).to eq("<?xml version=\"1.0\" encoding=\"UTF-8\"?><document><alertTemplate><description>How are things?</description><title>Hello World</title></alertTemplate></document>")
  end

  it 'can escape a document' do
    subject.template = TVML::Template::Alert.new.tap do |alert|
      alert.title = "Hello World"
    end
    expect(subject.build_escaped).to eq("<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?><document><alertTemplate><title>Hello World</title></alertTemplate></document>")
  end
end

require 'spec_helper'

describe TVML::Document do
  it 'can build a document' do
    subject.template = TVML::Template::Alert.new
    subject.template.title = "Hello World"
    subject.template.description = "How are things?"
    expect(subject.build).to eq("<?xml version=\"1.0\" encoding=\"UTF-8\"?><document><alertTemplate><description>How are things?</description><title>Hello World</title></alertTemplate></document>")
  end
end

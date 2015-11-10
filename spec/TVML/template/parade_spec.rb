require 'spec_helper'

describe TVML::Template::Parade do
  let(:document)   { TVML::Document.new }
  let(:sections)   { %w(section1 section2 section3) }
  let(:image_list) { ["http://rspec.test/img1.jpg",
                      "http://rspec.test/img2.jpg",
                      "http://rspec.test/img3.jpg"] }

  it 'should build to the correct format' do
    document.template = TVML::Template::Parade.new.tap do |parade|
      parade.list = TVML::Element::List.new.tap do |list|
        list.header          = TVML::Element::Header.from_value('RSpec')
        list.section         = TVML::Element::Section.from_value(sections.map { |s| TVML::Element::ListItemLockup.from_value s })
        list.related_content = TVML::Element::RelatedContent.from_value(TVML::Element::ImgDeck.from_value(image_list))
      end
    end

    expect(document.build).to eq("<?xml version=\"1.0\" encoding=\"UTF-8\"?><document><paradeTemplate><list><header><title>RSpec</title></header><section><listItemLockup><title>section1</title></listItemLockup><listItemLockup><title>section2</title></listItemLockup><listItemLockup><title>section3</title></listItemLockup></section><relatedContent><imgDeck><img src=\"http://rspec.test/img1.jpg\"/><img src=\"http://rspec.test/img2.jpg\"/><img src=\"http://rspec.test/img3.jpg\"/></imgDeck></relatedContent></list></paradeTemplate></document>")
  end


end

require 'spec_helper'

class RSpecElementOne < TVML::Element::Base
  element :title, :description
end

class RSpecElementTwo < TVML::Element::Base
  element :color, :size
end

describe TVML::Element::Base do
  it 'should have distinct element lists' do
    expect(RSpecElementOne.elements).to eq([:title, :description])
    expect(RSpecElementTwo.elements).to eq([:color, :size])
  end

  it 'should render the elements' do
    ele = RSpecElementOne.new
    ele.title = 'RSpec Rocks'
    ele.description = 'Tests are great.'
    expect(ele.build).to eq('<rSpecElementOne><title>RSpec Rocks</title><description>Tests are great.</description></rSpecElementOne>')
  end

end

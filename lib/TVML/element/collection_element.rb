module TVML
  module Element
    class CollectionElement < Base
      attr_accessor :items

      def self.from_value(items = [])
        sec = self.new
        sec.items = items.is_a?(Enumerable) ? items : [items]
        sec
      end

      def build(xml = nil, &_block)
        xml ||= Builder::XmlMarkup.new(TVML::BUILDER_OPTIONS)
        xml.__send__(node_name) do |node|
          items.each { |item| item.build node }
        end
      end
    end
  end
end

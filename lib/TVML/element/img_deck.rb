module TVML
  module Element
    class ImgDeck < Base
      attr_accessor :images

      def self.from_value(images = [])
        deck = self.new
        deck.images = images
        deck
      end

      def initialize(images = [])
        @images = images
      end

      def build(xml = nil, &_block)
        xml ||= Builder::XmlMarkup.new(TVML::BUILDER_OPTIONS)
        xml.__send__(node_name) do |node|
          images.each do |image|
            node.img src: image
          end
        end
      end

    end
  end
end

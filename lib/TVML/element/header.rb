module TVML
  module Element
    class Header < Base
      element :title

      def self.from_value(str)
        hdr = new
        hdr.title = str
        hdr
      end
    end
  end
end

module TVML
  module Template
    class Base < TVML::Element::Base
      def self.node_name
        "#{super}Template"
      end
    end
  end
end

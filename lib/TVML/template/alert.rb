module TVML
  module Template
    class Alert < Base
      attr_accessor :buttons, :description, :title

      def initialize
        super
        @buttons = []
      end

      def build
        super do |node|
          marshal_elements node, *%w(description title)
          buttons.each do |button_text|
            node.button { |s| s.text button_text }
          end
        end
      end
    end
  end
end

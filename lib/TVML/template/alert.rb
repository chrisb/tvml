module TVML
  module Template
    class Alert < Base
      element :description, :title
      attr_accessor :buttons

      def initialize
        super
        @buttons = []
      end

      def collapse_button_list
        @buttons = buttons.map do |button|
          next button if button.is_a?(TVML::Element::Button)
          TVML::Element::Button.from_value(button)
        end
      end

      def build(xml = nil, &block)
        super(xml) do |node|
          buttons.each { |b| TVML::Element::Button.from_value(b).build node }
        end
      end
    end
  end
end

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
          btn = TVML::Element::Button.new
          btn.text = button
          btn
        end
      end

      def build
        collapse_button_list
        super do |node|
          marshal_elements node
          node << buttons.map(&:build).join
        end
      end
    end
  end
end

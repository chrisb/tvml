module TVML
  module Element
    class Button < Base
      element :text

      def self.from_value(str)
        btn = new
        btn.text = str
        btn
      end

    end
  end
end

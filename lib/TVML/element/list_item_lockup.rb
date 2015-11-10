module TVML
  module Element
    class ListItemLockup < Base
      element :title

      def self.from_value(str)
        list_item = new
        list_item.title = str
        list_item
      end

    end
  end
end

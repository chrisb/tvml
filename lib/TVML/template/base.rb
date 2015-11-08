module TVML
  module Template
    class Base
      delegate :node_name, to: :class

      def self.node_name
        "#{name.demodulize.camelize(:lower)}Template"
      end

      def self.build(&block)
        new.build(&block)
      end

      def initialize_builder(&block)
        Builder::XmlMarkup.new.__send__(node_name, &block)
      end

      def build(&block)
        initialize_builder(&block)
      end

      def to_tvml
        @builder.to_s
      end

      def marshal_elements(node, *elements)
        elements.each do |ele|
          node.__send__ ele, send(ele) if send(ele).present?
        end
      end
    end
  end
end

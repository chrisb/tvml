module TVML
  module Element
    class Base
      delegate :node_name, to: :class

      def self.inherited(subclass)
        subclass.cattr_accessor(:elements) { [] }
      end

      def self.element(*element_names)
        element_names.each do |element_name|
          attr_accessor element_name
          elements << element_name.to_sym
        end
      end

      def self.node_name
        name.demodulize.camelize :lower
      end

      def self.build(&block)
        new.build(&block)
      end

      def initialize_builder(&block)
        Builder::XmlMarkup.new.__send__(node_name, &block)
      end

      def build(&block)
        if block_given?
          initialize_builder(&block)
        else
          initialize_builder { |b| marshal_elements b }
        end
      end

      def to_tvml
        @builder.to_s
      end

      def marshal_elements(node, *element_list)
        element_list = self.class.elements if element_list.empty?
        element_list.each do |ele|
          node.__send__ ele, send(ele) if send(ele).present?
        end
      end
    end
  end
end

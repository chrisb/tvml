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

      def build(xml = nil, &_block)
        xml ||= Builder::XmlMarkup.new(TVML::BUILDER_OPTIONS)
        xml.__send__(node_name) do |node|
          return yield xml if block_given?
          self.class.elements.select { |e| send(e).present? }.each do |element_name|
            element = send(element_name)
            next element.build(node)                  if element.is_a?(TVML::Element::Base)
            next element.each { |e| e.build node }    if element.respond_to?(:each)
            next node.__send__(element_name, element) if element.respond_to?(:to_s)
            fail "unknown element value for `#{element_name}`: #{element.inspect}"
          end
        end
      end

      def to_tvml
        build.to_s
      end
    end
  end
end

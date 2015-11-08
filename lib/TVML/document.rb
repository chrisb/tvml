module TVML
  class Document
    attr_accessor :builder, :template

    def initialize
      @builder = Builder::XmlMarkup.new
      @builder.instruct!
    end

    def build
      @builder.document do |doc|
        doc << @template.build if @template
      end
    end
  end
end

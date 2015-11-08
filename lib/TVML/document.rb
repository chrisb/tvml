module TVML
  class Document
    attr_accessor :builder, :template

    JS_ESCAPE_MAP	=	{ '\\' => '\\\\', '</' => '<\/', "\r\n" => '\n',
                      "\n" => '\n', "\r" => '\n', '"' => '\\"', "'" => "\\'" }

    def initialize
      @builder = Builder::XmlMarkup.new
      @builder.instruct!
    end

    def build
      @builder.document do |doc|
        doc << @template.build if @template
      end
    end

    def build_escaped
      escape_javascript(build)
    end

    private

    def escape_javascript(javascript)
      return '' unless javascript
      javascript.gsub(%r{(\|<\/|\r\n|\342\200\250|\342\200\251|[\n\r"'])}) { |match| JS_ESCAPE_MAP[match] }
    end
  end
end

require 'TVML/version'
require 'active_support/all'
require 'builder'

module TVML
  extend ActiveSupport::Autoload

  autoload :Document, 'TVML/document'

  module Element
    autoload :Base, 'TVML/element/base'
    autoload :Button, 'TVML/element/button'
  end

  module Template
    autoload :Base, 'TVML/template/base'
    autoload :Alert, 'TVML/template/alert'
    autoload :Catalog, 'TVML/template/catalog'
    autoload :DescriptiveAlert, 'TVML/template/descriptive_alert'
    autoload :Div, 'TVML/template/div'
    autoload :Form, 'TVML/template/form'
    autoload :List, 'TVML/template/list'
    autoload :Loading, 'TVML/template/loading'
    autoload :Main, 'TVML/template/main'
    autoload :Oneup, 'TVML/template/oneup'
    autoload :Parade, 'TVML/template/parade'
    autoload :ProductBundle, 'TVML/template/product_bundle'
    autoload :Rating, 'TVML/template/rating'
    autoload :Seach, 'TVML/template/search'
    autoload :Showcase, 'TVML/template/showcase'
    autoload :Stack, 'TVML/template/stack'
  end
end

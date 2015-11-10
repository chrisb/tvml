require 'TVML/version'
require 'active_support/all'
require 'builder'

module TVML
  extend ActiveSupport::Autoload

  BUILDER_OPTIONS = { indent: 2 }

  autoload :Document, 'TVML/document'

  module Element
    autoload :Base, 'TVML/element/base'
    autoload :CollectionElement, 'TVML/element/collection_element'

    autoload :Button, 'TVML/element/button'
    autoload :Header, 'TVML/element/header'
    autoload :ListItemLockup, 'TVML/element/list_item_lockup'
    autoload :ImgDeck, 'TVML/element/img_deck'
    autoload :List, 'TVML/element/list'
    autoload :Section, 'TVML/element/section'
    autoload :RelatedContent, 'TVML/element/related_content'
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

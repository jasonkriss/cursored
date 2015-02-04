require 'cursored/collection'

module Cursored
  module Controller
    extend ActiveSupport::Concern

    protected
    def render_cursored(relation, opts = {})
      options = opts.merge(params.slice(:cursor))
      collection = Cursored::Collection.new(relation, options)

      render({
        status: :ok,
        json: collection.records,
        meta: {
          cursor: collection.next
        }
      })
    end
  end
end

module Cursored
  class Collection
    def initialize(relation, opts = {})
      @relation = relation
      @limit = opts.fetch(:limit, Cursored.config.limit)
      @cursor = opts[:cursor]
    end

    def records
      padded_records[0..(limit - 1)]
    end

    def next
      records.last.send(Cursored.config.field) if has_more?
    end

    private
    attr_reader :relation, :limit, :cursor

    def padded_limit
      @padded_limit ||= limit + 1
    end

    def padded_records
      @padded_records ||= fetch_padded_records
    end

    def fetch_padded_records
      field = Cursored.config.field
      padded = relation.order(field => :desc).limit(padded_limit)
      cursor ? padded.where("#{relation.table_name}.#{field} < ?", cursor) : padded
    end

    def has_more?
      padded_records.length == padded_limit
    end
  end
end

require 'elasticsearch/persistence/model'

module Searchkick
  class Results
    def results_query(records, hits)
      hits.collect { |h| Place.find(h['_id']) }
    end
  end
end

class Place
  include Elasticsearch::Persistence::Model

  attribute :name, String
  attribute :link, String
  attribute :short_decription, String
  attribute :image, String

  searchkick

  def self.random
    Place.search(query: { filtered: { filter: { exists: { field: 'image' }}}})
          .to_a
          .sample
  end
end

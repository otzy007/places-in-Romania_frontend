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
  attribute :id, String
  attribute :name_en, String
  attribute :name_ro, String
  attribute :name_fr, String
  attribute :map, String
  attribute :osm_id, String
  attribute :lat, String
  attribute :long, String
  attribute :osm_class, String
  attribute :osm_type, String
  attribute :osm_display_name, String
  attribute :address, Hash
  attribute :osm_importance, String
  attribute :alt_names, Hash
  # attribute :location, Hash

  settings do
    mapping do
      indexes :location, type: 'geo_point'
    end
  end

  searchkick merge_mappings: true, locations: ["location"]

  def self.random
    Place.search(query: { filtered: { filter: { exists: { field: 'image' }}}})
          .to_a
          .sample
  end

  def search_data
    attributes.merge location: [lat, long]
  end
end

class Page
  include Mongoid::Document
  field :name, type: String
  field :order, type: Integer

  embedded_in :project
  embeds_many :features
  embeds_many :frames
end

class Feature
  include Mongoid::Document
  field :name, type: String
  field :order, type: Integer

  recursively_embeds_many
  embeds_many :frames
  embedded_in :page
end

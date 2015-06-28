class Frame
  include Mongoid::Document
  field :name, type: String
  field :order, type: Integer

  embedded_in :page
  embedded_in :feature
end

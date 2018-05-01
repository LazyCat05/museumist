class MuseumShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :founding_date, :url
  has_many :reviews

end

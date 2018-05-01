class MuseumShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :founding_date, :url, :review_list

  def review_list
    object.reviews
  end
end

class MuseumShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :founding_date, :url, :user_reviews

  has_many :reviews

  def user_reviews
    # We can now access the current_user with the keyword `scope`
    object.reviews.where(user: scope)
  end

end

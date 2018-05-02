class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :body, :user_id, :user_name
  belongs_to :user
  belongs_to :museum

  def user_name
    object.user.username
  end
end

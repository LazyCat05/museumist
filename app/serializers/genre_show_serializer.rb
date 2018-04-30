class GenreShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :museum_list

  # has_many :museums


  def museum_list
    object.museums
  end
end

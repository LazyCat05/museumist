class GenreShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :museum_list

  def museum_list
    object.museums
  end
end

class MuseumShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :founding_date, :url, :review_average, :image_url
  has_many :reviews


  #Calculate review average for the specific museum shown
  def review_average
    average = 0.0
    sum = 0.0
    count_nils = 0

    if object.reviews.count >= 1
      object.reviews.each do |review|
        #do not consider nil review ratings in your average calculation
        if review.rating.nil?
          count_nils += 1
        end

        sum += review.rating
      end

      average = sum / (object.reviews.count - count_nils)
    end
    #return calculated average; if 0, you know there is no average that could be calculated
    average.round(2)
  end
end

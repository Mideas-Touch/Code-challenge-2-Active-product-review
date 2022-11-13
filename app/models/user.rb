class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    # favorite_product_id = Review.find_by(star_rating: reviews.maximum(:star_rating)).product_id
    #     Product.find(favorite_product_id)

    def favorite_product
        self.reviews.order(:star_rating).last.product
    end

end
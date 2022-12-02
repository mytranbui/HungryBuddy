# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController

  def create
    @foodplace = Foodplace.find(params[:foodplace_id])
    @review = Review.new(review_params)
    @review.foodplace = @foodplace
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to foodplace_path(@foodplace) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "foodplaces/show", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :highlight, :rating, :date, :cleanliness, :service)
  end
end

# create_table "reviews", force: :cascade do |t|
#   t.bigint "user_id", null: false
#   t.bigint "foodplace_id", null: false
#   t.text "comment"
#   t.string "highlight"
#   t.float "rating"
#   t.date "date"
#   t.float "cleanliness"
#   t.float "service"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["foodplace_id"], name: "index_reviews_on_foodplace_id"
#   t.index ["user_id"], name: "index_reviews_on_user_id"
# end

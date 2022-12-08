if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {foodplace: @foodplace, review: Review.new})
  json.inserted_item render(partial: "foodplaces/review", formats: :html, locals: {review: @review})
  json.status render(partial: "foodplaces/user_rating", formats: :html, locals: {foodplace: @foodplace})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {foodplace: @foodplace, review: @review})
end

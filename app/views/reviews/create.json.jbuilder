if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {foodplace: @foodplace, review: Review.new})
  json.inserted_item render(partial: "foodplaces/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {foodplace: @foodplace, review: @review})
end

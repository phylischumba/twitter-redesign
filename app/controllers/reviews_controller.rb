class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
    @reviews = Review.order('created_at DESC').includes(:author)
    @users = User.all
  end

  def show; end

  def new
    @review = Review.new(review_params)
    @review.author_id = current_user.id
  end

  def edit; end

  def create
    @review = Review.new(review_params)
    @review.author_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to reviews_url, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:Text, :author_id)
  end
end

class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :destroy]
  before_action :set_movie, except: [:show, :edit]

  def index
    @comments = @movie.comments
  end
  
  def show
  end

  def new
    @comment = @movie.comments.build
  end

  def edit
  end

  def create
    @comment = @movie.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
          format.html { redirect_to @movie, notice: 'Comment was successfully created.' }
          format.json { render action: 'show', status: :created, location: @comment }
        else
          format.html { render action: 'new' }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end

  protected

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :author)
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update]

  def create
  	@discussion = Discussion.find(params[:id])
  	@post = current_user.posts.build(post_params)
  	@post.discussion = @discussion
  		respond_to do |format|
  		if @post.save
	  		format.html do
	  			redirect_to discussion_path(params[:id])
	  		end
  		else
  			format.html do
	  			render 'new'
	  		end
	  	end
	  end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html do
          redirect_to discussion_path(@post.discussion), notice: "Your post has been edited"
        end
      else
        render 'edit'
      end
    end
  end

  def destroy
  end

  private
  def post_params
  	params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end 
end

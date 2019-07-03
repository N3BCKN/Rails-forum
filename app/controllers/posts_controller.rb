class PostsController < ApplicationController
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
  end

  def destroy
  end

  private
  def post_params
  	params.require(:post).permit(:content)
  end
end

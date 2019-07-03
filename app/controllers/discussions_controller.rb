class DiscussionsController < ApplicationController
  
  def show
  	@discussion = Discussion.find(params[:id])
    @posts = @discussion.posts.page params[:page]
    @post = current_user.posts.build
  end
  def new
  	@discussion = current_user.discussions.build
  end

  def create
  	@subject = Subject.find(params[:discussion][:subject])
  	@discussion = current_user.discussions.build(discussion_params)
  	@discussion.subject = @subject
  	respond_to do |format| 
  		if @discussion.save
  			format.html do 
  				redirect_to discussion_path(@discussion)
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
  def discussion_params
  	params.require(:discussion).permit(:name, :content)
  end
end

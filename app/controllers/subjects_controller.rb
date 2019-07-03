class SubjectsController < ApplicationController
  def show
  	@subject = Subject.find(params[:id])
  	@discussions = @subject.discussions.page params[:page]
  end
end

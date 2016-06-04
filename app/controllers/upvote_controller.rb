class UpvoteController < ApplicationController

  def upvote
    return unless set_user
    complaint = Complaint.find(params[:id])
    if complaint.liked_by @user
      return render :json => {:success => true}
    end
  end

  private

  def set_user
    @user = current_user if user_signed_in?
  end
end

class UpvoteController < ApplicationController

  def upvote
    return unless set_user
    complaint = Complaint.find(params[:id])
    complaint.liked_by @user
  end

  private

  def set_user
    @user = current_user if user_signed_in?
  end
end

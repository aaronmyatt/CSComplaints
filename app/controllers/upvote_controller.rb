class UpvoteController < ApplicationController

  def upvote(complaint)
    return unless set_user
    complaint.liked_by @user 
  end

  private

  def set_user
    @user = current_user if user_signed_in?
  end
end

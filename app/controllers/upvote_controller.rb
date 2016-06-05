class UpvoteController < ApplicationController

  def upvote
    return unless set_user
    complaint = Complaint.find(params[:id])
    if complaint.liked_by @user
    response = {
      upvotes: complaint.votes_for.size
    }
    render json: response
    end
  end

  def downvote
    return unless set_user
    complaint = Complaint.find(params[:id])

    complaint.unliked_by @user
    render json: { success: true }
  end

  private

  def set_user
    @user = current_user if user_signed_in?
  end
end

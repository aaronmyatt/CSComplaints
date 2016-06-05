class UpvoteController < ApplicationController
  def upvote
    set_complaint
    return unless set_user
    if @complaint.liked_by @user
      response = {
        upvotes: @complaint.votes_for.size
      }
      render json: response
    end
  end

  def downvote
    set_complaint
    return unless set_user
    if @complaint.unliked_by @user
      response = {
        upvotes: @complaint.votes_for.size
      }
      render json: response
    end
  end

  private

  def set_complaint
    @complaint = Complaint.find(params[:id])
  end

  def set_user
    @user = current_user if user_signed_in?
  end
end

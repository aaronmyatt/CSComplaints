class BotController < ActionController::Base
  def facebook
        complaint = Complaint.new
        complaint.description = params[:result][:parameters][:Complaint][:complaint]
        complaint.title = params[:result][:parameters][:Complaint][:complaint]
        complaint.address = params[:result][:parameters][:Complaint][:location]
        complaint.user_id = 1
        complaint.save!

        response =
            {
              "speech": "Your complaint has been registered at the link here: http://cscomplaints.herokuapp.com/complaints/#{complaint.id}",
              "displayText": "Thanks for your complaint, you can find it at the link here: http://cscomplaints.herokuapp.com/complaints/#{complaint.id}",
              "data": "",
              "contextOut": [{"name":"weather", "lifespan":2, "parameters":{"city":"Rome"}}],
              "source": "DuckDuckGo"
            }

  render json: response
  end
end

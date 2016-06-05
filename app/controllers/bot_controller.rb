class BotController < ActionController::Base
  def facebook
    response =
    {
      "Body":
        {
        "speech": "Barack Hussein Obama II is the 44th and current President of the United States.",
        "displayText": "Barack Hussein Obama II is the 44th and current President of the United States, and the first African American to hold the office. Born in Honolulu, Hawaii, Obama is a graduate of Columbia University   and Harvard Law School, where ",
        "data": "",
        "contextOut": "",
        "source": "DuckDuckGo"
        }
      }
    respond_to do |format|
    format.json {render json: response }
  end
  end
end

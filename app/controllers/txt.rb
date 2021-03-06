MathTxt.controllers :txt do
  post :index do
    # {"AccountSid"=>"ACd13bade3c51c7c83670737a310dc790a",
    # "Body"=>"Add $5 to reed",
    # "ToZip"=>"94956",
    # "FromState"=>"CA",
    # "ToCity"=>"POINT REYES STATION",
    # "SmsSid"=>"SM7a9f50af2f1cc489bbbd1fe239bbd1d8",
    # "ToState"=>"CA",
    # "To"=>"+14153902014",
    # "ToCountry"=>"US",
    # "FromCountry"=>"US",
    # "SmsMessageSid"=>"SM7a9f50af2f1cc489bbbd1fe239bbd1d8",
    # "ApiVersion"=>"2010-04-01",
    # "FromCity"=>"SANTA ROSA",
    # "SmsStatus"=>"received",
    # "From"=>"+17077998675",
    # "FromZip"=>"95403"}
    logger.info "Message recieved."

    content = params["Body"].strip

    if content
      Message.inc(content, params["From"])

      content_type :xml
      render :success
    else
      render :fail
    end
  end
end

class MathTxt < Padrino::Application
  register Padrino::Rendering
  register Padrino::Helpers

  enable :sessions

  get '/' do
    render :index
  end

  ##
  # You can manage errors like:
  #
  #   error 404 do
  #     render 'errors/404'
  #   end
  #
  #   error 505 do
  #     render 'errors/505'
  #   end
  #
end

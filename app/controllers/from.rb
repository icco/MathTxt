MathTxt.controllers :from do
  get :index do
    @messages = Message.get_all_from "+17077998675"
    render 'from/index'
  end
end

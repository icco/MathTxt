MathTxt.controllers :from do
  get :index do
    msgs = Message.get_all_from "+17077998675"
    locals :messages => msgs
    render 'from/index'
  end
end

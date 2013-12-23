class PrincipalController < ApplicationController
  
before_filter :authenticate_user!
  def index
  reset_session
  
 @principal = Principal.find_by(params[:email])  

  puts "#$$$$$$$$$$$$$$$$$$$$ student $$$44#########################################33"
  puts @principal.inspect
  puts "#$$$$$$$$$$$$$$$$$$$$ student $$$44#########################################33"
  

  end
end

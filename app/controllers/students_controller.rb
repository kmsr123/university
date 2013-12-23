class StudentsController < ApplicationController

  before_filter :authenticate_user!
 

  before_action :set_student, :only =>[:show, :edit, :update, :destroy]


  def index
 

  puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"

  puts current_user.email
  #render :text => params.inspect and return
  puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$4"
   #sign_out: current_user
  #reset_session
  @students = Student.all
  #@student = Student.find_by(params[:email])
  #render :text => params.inspect
  #puts "#$$$$$$$$$$$$$$$$$$$$ student $$$44#########################################33"
  #puts @student.inspect
  #puts "#$$$$$$$$$$$$$$$$$$$$ student $$$44#########################################33"
  end

  def new
    #if current_user.has_role? :admin
      @student = Student.new
      @address = Address.new
  #redirect_to :action => "index"
  end

  def create
   
    @student = Student.new(student_params)
     @student.add_role :student

    if @student.save

      key = @student.id 
      Student.find(key).create_address(address_params)
     #flash[:notice]="error occured"
      redirect_to :action => "index"
      #else
        
      #render :text => "errors"-
      #render :action => 'new' 
      #redirect_to :action => 'index
    end
  end

  def show
  @order = Student.find(params[:id])
end

  def edit

    #render :text => params.inspect and return
  end

  def update
     @student.update(student_params)
      #render :text => k.class.inspect and return
      @address.update(address_params)
     
      redirect_to :action => "show"
  end

  def destroy
#    render :text => @student.id.inspect and return
    if current_user.has_role? :admin
      if @student.destroy
       render :text => "it was deleted"
      else
    render :text => "check routes onces"
   end
 end
   else
     redirect_to :action => "show"
  end


  private

  #def set_address
   #@student = Student.find(params[:id])

   # @addr = @student.address

  
    #@add =  @st. addressable_id
    #render :text => params.inspect
    #@address = Address.find(params[:id])
  #end
  
  def address_params
    params.require(:address).permit(:state,:district,:town,:village, :zipcode)
  end


  def set_student
    #render :text => params.inspect and return
    @student = Student.find(params[:id])
   #render :text => @student.id.inspect and return
    @address  = @student.address   
    #render :action => "destroy"
  end

  def student_params
   params.require(:student).permit(:full_name, :fathername, :gender, :dob, :age, :fee, :phone, :email, :section,:photo)
  end

end















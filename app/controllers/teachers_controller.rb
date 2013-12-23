class TeachersController < ApplicationController
before_filter :authenticate_user!

before_action :set_teacher, :only => [:show, :edit, :update, :destroy]


def index
   #reset_session
   @teacher = Teacher.all
   @search = Sunspot.search(Teacher) do
    fulltext params[:search]    
   #render :text => params.inspect and return 
   #@students = @teachers.students
     
   #search = @students.search do
    # fulltext params[:search]
  end
  puts "-----------------------------------------------"
  p @search.inspect
  p "----------------------------------------------"
  @students = @search.results
  #puts "#$$$$$$$$$$$$$$$$$$$$ teacher $$$44#########################################33"
  #puts @teacher.inspect
  #puts "#$$$$$$$$$$$$$$$$$$$$ teacher $$$44#########################################33"
 
end
  

  def new
    if current_user.has_role? :admin
      @teacher = Teacher.new
      @address = Address.new
    end
     else
      redirect_to :action => "index"
    end
  
  def create
   
    @teacher = Teacher.new(teacher_params)
    
     @teacher.add_role :teacher
     
     if @teacher.save
      key = @teacher.id 
    puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    puts key
    puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"    
    #render :text => params.inspect and return

      
      Teacher.find(key).create_address(address_params)
     
      redirect_to :action => "index"
      else
      render :text => "errors" 
    #@address = Address.new(address_params)
    #if @teacher.save
     # redirect_to :action => "index"
    
     #render action :new
    end
  end

  def show
  
  end

  def edit
  
   

  end

  def update
     @teacher.update(teacher_params)
      #render :text => k.class.inspect and return
      @address.update(address_params)
     
      redirect_to :action => "show"
  end

  def destroy
if current_user.has_role? :admin 

    if @teacher.delete
    redirect_to :action => "index"
      else
    render :text => "check routes onces"
   end
 end
        redirect_to :action => "index"

end

  private

  #def set_address
   #@teacher = teacher.find(params[:id])

   # @addr = @teacher.address

  
    #@add =  @st. addressable_id
    #render :text => params.inspect
    #@address = Address.find(params[:id])
  #end
  
  def address_params
    params.require(:address).permit(:state,:district,:town,:village, :zipcode)
  end


  def set_teacher
    render :text => params.inspect and return
    @teacher = Teacher.find(params[:id])
    
    @address = @teacher.address      
     #render :text => @address.inspect
  end

  def teacher_params
   params.require(:teacher).permit(:full_name,:gender,:experience,:salary,:phone,:email,:subjects,:photo)
  end

end
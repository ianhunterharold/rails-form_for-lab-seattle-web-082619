class StudentsController < ApplicationController
  
  def index
    @student = Student.all 
  end 
  
  def new
    @student = Student.new
  end 

  def create 
    @student = Student.new(student_params) 
    if @student.valid? 
      @student.save 
      redirect_to student_path(@student)
    else
      redirect_to students_path(@student)
    end
  
  end 

  def show
    @student = Student.find(params[:id])
  end 

  def edit
    @student = Student.find(params[:id])
  end 

  def update
    @student = Student.find(params[:id])
	  @student.update(student_params)
	  redirect_to student_path(@student)
  end 

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
  

end

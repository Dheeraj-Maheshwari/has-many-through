class DoctorsController < ApplicationController
	def index
		@doctors = Doctor.all
	end

	def create_doctor 

    @doctor = Doctor.create(name: params[:doctor][:name] ,
    	department: params[:doctor][:department] ,
    	fees: params[:doctor][:fees] )	
	 		respond_to do |format|
      if @doctor.save
        format.js { redirect_to doctor_comments_path(@doctor), turbolinks: false}
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
	end  


	def new
		@doctor = Doctor.new
	end 

	def create
	# 	doctor = Doctor.new(doctor_params)
	# 	if doctor.save
	# 		redirect_to doctor
	# 		else
	# 			render :new
	# 		end
	end


	def edit 
		@doctor = Doctor.find(params[:id])
	end

	def update
		doctor = Doctor.find(params[:id])
		if doctor.update_attributes(doctor_params)
			redirect_to doctor
		else
			render :edit
		end
	end

	def show
		@doctor = Doctor.find(params[:id])
	end

	def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
   end
  end

	private

	def doctor_params
		params.require(:doctor).permit(:name, :department,:fees)
	end
end
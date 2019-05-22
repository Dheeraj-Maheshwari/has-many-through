class AppointmentsController < ApplicationController
		def index
		@appointments = Appointment.all
	end 


	def new
		@appointment = Appointment.new
	end 

	def create
		doctor_id = params[:appointment][:doctor]
		patient_id = params[:appointment][:patient]
		appointment = Appointment.new(doctor_id: doctor_id, patient_id: patient_id)
		 respond_to do |format|
      if appointment.save
        format.html { redirect_to appointment, notice: 'appointment was successfully created.' }
        format.json { render :show, status: :created, location: appointment }
      else
        format.html { render :new }
        format.json { render json: appointment.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit 
		@appointment = Appointment.find(params[:id])
	end

	def update
		doctor_id = params[:appointment][:doctor]
		patient_id = params[:appointment][:patient]
		appointment = Appointment.find(params[:id])
		if appointment.update_attributes(doctor_id: doctor_id, patient_id: patient_id)
			redirect_to appointment
		else
			render :edit
		end
	end

	def show
		@appointment = Appointment.find(params[:id])
	end

	def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end


	private

	 def appointment_params
	 params.require(:appointment).permit(:patient_id, :doctor_id)
	# 	   # params.require(:appointment).permit(:patient_id, :doctor_id,Patient.name,Doctor.name)

	
	 end
end

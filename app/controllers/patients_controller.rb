class PatientsController < ApplicationController

	def index
		# @patients = Patient.all
		# @patients = Patient.where(allergies: true)
	  # @patients =	Doctor.scoped_by_patient("john")
		 @patients = Patient.allergies
	end 
	def new
		@patient = Patient.new
	end 

	def create
			patient = Patient.new(patient_params)
		if patient.save
			 redirect_to patient
		else
			render :new
		end
	end
	def edit 
		@patient = Patient.find(params[:id])
	end

	def update
		patient = Patient.find(params[:id])
		if patient.update_attributes(patient_params)
			redirect_to patient
		else
			render :edit
		end
	end

	def show
		@patient = Patient.find(params[:id])
	end

	def destroy
		
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to root_path
  end

	private

	def patient_params
		
		params.require(:patient).permit(:name,:disease,:address,:permanentaddress,:gender,:allergies,:allergetic_to)
	end
end

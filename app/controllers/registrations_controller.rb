class RegistrationsController < Devise::RegistrationsController

	def new 
		$role = 'Student'
		super
		
	end

	def edit
		super
	end
end

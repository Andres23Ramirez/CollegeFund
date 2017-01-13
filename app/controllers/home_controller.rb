class HomeController < ApplicationController

	def index
		if user_signed_in?
			if current_user.has_role? :parent
				@parent = Parent.all
				@parent.each do |parent|
					@user = parent.user
					if @user == current_user
						@perfil = parent

					end
				end

			elsif current_user.has_role? :student
				@student = Student.all
				@student.each do |student|
					@user = student.user
					if @user == current_user
						@perfil = student

					end
				end

			elsif current_user.has_role? :donor
				@donor = Donor.all
				@donor.each do |donor|
					@user = donor.user
					if @user == current_user
						@perfil = donor

					end
				end
			end
		end						
	end
end

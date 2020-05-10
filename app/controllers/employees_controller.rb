class EmployeesController < ApplicationController
    # # render => no view template required, rendering objects directly from controller. to pass variables to Views, use @, for rendering from controller, no need to use @.
    # # for json, no view template required as it uses render method in this controller.
    def index
        @employees = Employee.all
        respond_to do |format|
        format.html
        format.json {render json: @employees.as_json(except: [:created_at, :updated_at], root: true, include: {department: {except: [:created_at, :updated_at]}})}
        format.xml
        end
    end

    def show
        @employee = Employee.find(params[:id])
        respond_to do |format|
        format.html
        format.json {render json: @employee.as_json }
        format.xml 
        end
    end

    private

	def employee_params
		params.require(:employee).permit!
	end

end


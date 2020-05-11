class EmployeesController < ApplicationController
    # # render => no view template required, rendering objects directly from controller. to pass variables to Views, use @, for rendering from controller, no need to use @.
    # # for json, no view template required as it uses render method in this controller.
    def index
        @employees = Employee.all
        employees = Employee.all
        respond_to do |format|
        format.html
        # format.json {render json: employees.as_json(except: [:created_at, :updated_at], root: true, include: {department: {except: [:created_at, :updated_at]}})}
        format.json {render json: employees}
        format.xml
        end
    end

    def index2
        @employees = Employee.all
        respond_to do |format|
        format.html
        format.xml
        end
    end
    
    # # https://apidock.com/rails/ActiveRecord/QueryMethods/includes
    def org_chart
        # # access to department, an assocated model, and in the departments table, where hierarchy column = "the condition"
        # # 関連付しているDepartmentモデルのDepartment”S”テーブルのhierarchyコラムを使って条件の絞り込み
        @employees_a = Employee.includes(:department).where(departments: {hierarchy:"A"})
        @employees_b1 = Employee.includes(:department).where(departments: {hierarchy:"B1"})
        @employees_b1c3_boss = Employee.includes(:department).where(departments: {hierarchy:"B1C3"}).where(rank: 1)[0] # whereを使うとArrayに保存されるのでindex[]が必要となる
        @employees_b1c3 = Employee.includes(:department).where(departments: {hierarchy:"B1C3"}).where(rank: 2)
        @department_a = Department.all.find_by(hierarchy:"A").name # @department_a = Department.all.where(hierarchy:"A")[0].nameで結果は同じ。whereを使うとArrayに保存されるのでindex[]が必要となる
        @department_b1 = Department.all.find_by(hierarchy:"B1").name # @department_a = Department.all.where(hierarchy:"A")[0].nameで結果は同じ。whereを使うとArrayに保存されるのでindex[]が必要となる
        @department_b1c3 = Department.all.find_by(hierarchy:"B1").name # @department_a = Department.all.where(hierarchy:"A")[0].nameで結果は同じ。whereを使うとArrayに保存されるのでindex[]が必要となる
        
        respond_to do |format|
        format.xml
        end
    end

    private

	def employee_params
		params.require(:employee).permit!
	end

end


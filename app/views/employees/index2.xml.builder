xml.instruct!
xml.employees do
    @employees.each do |employee|
        xml.employee("name": employee.name, "rank": employee.rank, "department": employee.department.name)
    end
end
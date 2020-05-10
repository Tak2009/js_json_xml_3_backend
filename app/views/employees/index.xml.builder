xml.instruct!
xml.employees do
    @employees.each do |employee|
        xml.employee do
            xml.name employee.name 
            xml.rank(employee.rank, "type": "integer") 
            xml.department employee.department.name
        end
    end
end
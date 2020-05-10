xml.instruct!
xml.department("name": @department_a) do
    @employees_a.each do |employee| 
        xml.employee("name": employee.name) do
            xml.department("name": @department_b1) do
                    @employees_b1.each do |employee|
                        xml.employee("name": employee.name) do
                           xml.department("name": @department_b1c3) do
                                @employees_b1c3.each do |employee|
                                    xml.employee("name": employee.name) do
                                    
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

 
    
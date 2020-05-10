xml.instruct!
xml.employee do
  xml.name @employee.name 
  xml.rank @employee.rank
  xml.department @employee.department.name
end
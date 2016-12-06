package oncourse.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import oncourse.model.Department;
import oncourse.model.dao.DepartmentDao;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentDao departmentDao;

    @RequestMapping("/department/list")
    public String list( ModelMap models )
    {
        models.put( "departments", departmentDao.getDepartments() );
        return "department/list";
    }
    @RequestMapping(value = "/departmentadd", method = RequestMethod.POST)
    @ResponseBody
    public Department ajaxadd(@RequestBody Department sub ) 
    {
      
 		return departmentDao.saveDepartment(sub); 
    }
}

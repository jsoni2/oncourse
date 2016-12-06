package oncourse.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import oncourse.model.Program;
import oncourse.model.dao.ProgramDao;

@Controller
public class ProgramController {

    @Autowired
    private ProgramDao programDao;

    @RequestMapping("/program/list")
    public String list( ModelMap models )
    {
        models.put( "programs", programDao.getPrograms() );
        return "program/list";
    }

    @RequestMapping("/program/view")
    public String view( @RequestParam Long id, ModelMap models )
    {
        models.put( "program", programDao.getProgram( id ) );
        return "program/view";
    }
    @RequestMapping(value="/viewProgram/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Program getProgram(@PathVariable Long id) 
    {	
    	System.out.println(programDao.getProgram(id).getName());
    	
        return programDao.getProgram(id);
        
    }
}

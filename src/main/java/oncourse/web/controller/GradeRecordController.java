package oncourse.web.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import oncourse.model.GradeRecord;
import oncourse.model.Term;
import oncourse.model.User;
import oncourse.model.dao.CourseDao;
import oncourse.model.dao.GradeDao;
import oncourse.model.dao.GradeRecordDao;
import oncourse.security.SecurityUtils;

@Controller
public class GradeRecordController {

    @Autowired
    private CourseDao courseDao;

    @Autowired
    private GradeDao gradeDao;

    @Autowired
    private GradeRecordDao gradeRecordDao;

    @RequestMapping("/grade/list")
    public String list( ModelMap models )
    {
        int year = Calendar.getInstance().get( Calendar.YEAR );
        List<Integer> years = new ArrayList<Integer>();
        for( int i = 0; i < 4; ++i )
            years.add( year - i );
        models.put( "years", years );
        models.put( "courses", courseDao.getCourses() );
        models.put( "grades", gradeDao.getGrades() );

        User user = SecurityUtils.getUser();
        models.put( "user", user );
        models.put( "gradeRecords", gradeRecordDao.getGradeRecords( user ) );
        return "grade/list";
    }

    @RequestMapping("/grade/add")
    public String add( @RequestParam String season, @RequestParam Integer year,
        @RequestParam Long courseId, @RequestParam Long gradeId )
    {
        GradeRecord gradeRecord = new GradeRecord();
        gradeRecord.setStudent( SecurityUtils.getUser() );
        gradeRecord.setTerm( new Term( year, season ) );
        gradeRecord.setCourse( courseDao.getCourse( courseId ) );
        gradeRecord.setGrade( gradeDao.getGrade( gradeId ) );
        gradeRecord = gradeRecordDao.saveGradeRecord( gradeRecord );
        return "redirect:list";
    }
    
    @RequestMapping("/addgrade")
    public GradeRecord addgrade( @RequestParam String season, @RequestParam Integer year,
        @RequestParam Long courseId, @RequestParam Long gradeId )
    {
        GradeRecord gradeRecord = new GradeRecord();
        gradeRecord.setStudent( SecurityUtils.getUser() );
        gradeRecord.setTerm( new Term( year, season ) );
        gradeRecord.setCourse( courseDao.getCourse( courseId ) );
        gradeRecord.setGrade( gradeDao.getGrade( gradeId ) );
        return gradeRecordDao.saveGradeRecord( gradeRecord );
        
    }
}

package com.bass.test.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.bass.test.service.StudentService;
import com.bass.test.service.UserService;
import com.bass.test.vo.StudentInfo;
import com.bass.test.vo.UserInfo;

@Controller
public class UserController {
@Autowired
private UserService us;

@RequestMapping( value="/userinfo", method=RequestMethod.GET)
@ResponseBody

public List<UserInfo> selectUserList(UserInfo ui){
return us.selectUserList(ui);

}

/*@RequestMapping( value="/userinfo", method=RequestMethod.POST)
@ResponseBody
public List<UserInfo> insertUserList(UserInfo ui){

return us.insertUserList(ui);

}*/

/*@RequestMapping( value="/userinfo", method=RequestMethod.PUT)
@ResponseBody

public List<UserInfo> updateUserList(UserInfo ui){
return us.updateUserList(ui);

}
*/
/*@RequestMapping( value="/userinfo", method=RequestMethod.DELETE)

@ResponseBody

public List<UserInfo> deleteUserList(UserInfo ui){

//return us.deleteUserList(ui);

}*/

/*@RequestMapping( value="/userinfo/{uiNum}", method=RequestMethod.GET)

public String selectUser(@PathVariable Integer uiNum){

//return us.selectUser(uiNum);

//}
*/
@RequestMapping(value="/userinfo/{uiNum}",method=RequestMethod.POST)

@ResponseBody

public Integer insertUser(@RequestBody UserInfo ui,@PathVariable Integer uiNum) {

return us.insertUser(ui);

}

@RequestMapping(value="/userinfo/{uiNum}",method=RequestMethod.PUT)

@ResponseBody

public Integer updateUser(@RequestBody UserInfo ui,@PathVariable Integer uiNum) {

return us.updateUser(ui);

}

@RequestMapping(value="/userinfo/{uiNum}",method=RequestMethod.DELETE)

@ResponseBody

public Integer deleteUser(@PathVariable Integer uiNum) {

return us.deleteUser(uiNum);

}

}


	


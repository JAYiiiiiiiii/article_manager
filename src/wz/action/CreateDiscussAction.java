package wz.action;

import java.util.List;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import wz.model.MainForum;
import wz.model.SubForum;
import wz.model.SubSubForum;
import wz.service.MainForumBiz;
import wz.service.SubForumBiz;
import wz.service.SubSubForumBiz;

public class CreateDiscussAction extends BaseAction{
	private String mainForum;
	private String subForum;
	private String subSubForum;
	
	private MainForumBiz mainBiz;
	private SubForumBiz subBiz;
	private SubSubForumBiz subSubBiz;
	
	
	
	
	/**
	 * @return subSubForum
	 */
	public String getSubSubForum() {
		return subSubForum;
	}
	/**
	 * @param subSubForum 要设置的 subSubForum
	 */
	public void setSubSubForum(String subSubForum) {
		this.subSubForum = subSubForum;
	}
	/**
	 * @return subSubBiz
	 */
	public SubSubForumBiz getSubSubBiz() {
		return subSubBiz;
	}
	/**
	 * @param subSubBiz 要设置的 subSubBiz
	 */
	public void setSubSubBiz(SubSubForumBiz subSubBiz) {
		this.subSubBiz = subSubBiz;
	}
	public MainForumBiz getMainBiz() {
		return mainBiz;
	}
	public SubForumBiz getSubBiz() {
		return subBiz;
	}
	public void setSubBiz(SubForumBiz subBiz) {
		this.subBiz = subBiz;
	}
	public void setMainBiz(MainForumBiz mainBiz) {
		this.mainBiz = mainBiz;
	}
	public String getMainForum() {
		return mainForum;
	}
	public void setMainForum(String mainForum) {
		this.mainForum = mainForum;
	}
	public String getSubForum() {
		return subForum;
	}
	public void setSubForum(String subForum) {
		this.subForum = subForum;
	}
	
	
	@Override
	public String execute() {
		try {
			if (mainForum != null &&mainForum.length()>0 && subForum != null && subForum.length()>0
				&& subSubForum != null && subSubForum.length()>0){
				MainForum main = new MainForum();
				main.setTitle(mainForum);
				ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
				if (mainBiz == null)
					 mainBiz = (MainForumBiz)context.getBean("mainForumBiz");
				if (!mainBiz.add(main)){
					this.addFieldError("create_result", "该目录已经存在");
					return "create";
				}
				
				String [] subf = subForum.split(";");
				String [] subSubf = subSubForum.split(";");
				int size = subf.length;
				for (int i=0; i<size; i++){
					System.out.println("子目录:"+subf[i]);
					SubForum sub = new SubForum(main,subf[i]);
					if (subBiz == null)
						subBiz = (SubForumBiz)context.getBean("subForumBiz");
					subBiz.add(sub);
					String [] subSubf1 = subSubf[i].split(",");
					int size1 = subSubf1.length;
					for (int j=0; j<size1; j++){
						System.out.println("子目录:"+subSubf[j]);
						SubSubForum subSub = new SubSubForum(sub,subSubf1[j]);
						if (subSubBiz == null)
							subSubBiz = (SubSubForumBiz)context.getBean("subSubForumBiz");
						subSubBiz.add(subSub);
					}
				}
				
				this.addFieldError("create_result", "创建成功");
				return SUCCESS;
			}
			return ERROR;
		} catch (BeansException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
	}
	
}

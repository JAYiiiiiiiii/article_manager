package wz.action;

import java.util.List;

import wz.model.Post;
import wz.service.MainForumBiz;
import wz.service.PostBiz;

public class MoreAction extends BaseAction {
	private int type;//第一层目录ID
	private int page;
	private PostBiz postBiz;
	private MainForumBiz mainForumBiz;
	
	
	
	
	

	public void setMainForumBiz(MainForumBiz mainForumBiz) {
		this.mainForumBiz = mainForumBiz;
	}

	public MainForumBiz getMainForumBiz() {
		return mainForumBiz;
	}

	public void setType(int type) {
		this.type = type;
	}

	public void setPage(int page) {
		this.page = page;
	}


	public void setPostBiz(PostBiz postBiz) {
		this.postBiz = postBiz;
	}


	@Override
	public String execute() throws Exception {
		System.out.println("type"+":"+type+"page:"+page);
		String typename = null;
		switch (type) {
		case -1:
			typename = "最新文章";
			break;
		case -2:
			typename = "精品文章";
			break;
		case -3:
			typename = "网站热文";
			break;
		default:
			typename = mainForumBiz.getMainForumById(type).getTitle();
			break;
		}
		if (type>-4&&page>0){
			List<Post>posts = postBiz.getPostByType(type, page, 10);
			getRequest().put("posts", posts);
			getRequest().put("page", page);
			getRequest().put("type", type);
			getRequest().put("typename", typename);
			return SUCCESS;
		}
		return ERROR;
	}
	

}

package kr.spring.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.spring.project.pagination.Criteria;
import kr.spring.project.pagination.PageMaker;
import kr.spring.project.rss.FeedMessage;
@Service
public class HomeServiceImp implements HomeService {

	@Override
	public PageMaker getPageMaker(Criteria cri, int displayPageNum, int totalCount) {
		PageMaker pageMaker = new PageMaker
				(totalCount,displayPageNum,cri);
		return pageMaker;
	}
	@Override
	public List<FeedMessage> getListFeedMessage(List<FeedMessage> feedMessages, Criteria cri){
		List<FeedMessage> searchMessages = new ArrayList<FeedMessage>();
		for(FeedMessage tmp : feedMessages) {
			if(tmp.getTitle().contains(cri.getSearch()))
				searchMessages.add(tmp);
		}
		int totalCount = searchMessages.size();
		int range = totalCount - cri.getPage()*cri.getPerPageNum();
		//현재 페이지의 게시글 갯수가 perPageNum보다 작을 때
		if(totalCount != 0 && range < 0 )
			return searchMessages.subList(cri.getPageStart(),cri.getPageStart()+(cri.getPerPageNum()+range));
		else if(totalCount != 0)
			return searchMessages.subList(cri.getPageStart(),cri.getPageStart()+cri.getPerPageNum());
		//게시글이 0개일 때
		else
			return null;
	}
	@Override
	public int getCountListFeedMessage(List<FeedMessage> feedMessages, Criteria cri) {
		List<FeedMessage> searchMessages = new ArrayList<FeedMessage>();
		for(FeedMessage tmp : feedMessages) {
			if(tmp.getTitle().contains(cri.getSearch()))
				searchMessages.add(tmp);
		}
		return searchMessages.size();
	}
	
}

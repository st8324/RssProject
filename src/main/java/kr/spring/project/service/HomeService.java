package kr.spring.project.service;

import java.util.List;

import kr.spring.project.pagination.Criteria;
import kr.spring.project.pagination.PageMaker;
import kr.spring.project.rss.FeedMessage;

public interface HomeService {
	public PageMaker getPageMaker(Criteria cri, int displayPageNum, int totalCount);
	public List<FeedMessage> getListFeedMessage(List<FeedMessage> feedMessages, Criteria cri);
	public int getCountListFeedMessage(List<FeedMessage> feedMessages, Criteria cri);
}

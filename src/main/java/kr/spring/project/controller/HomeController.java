package kr.spring.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.project.pagination.Criteria;
import kr.spring.project.pagination.PageMaker;
import kr.spring.project.rss.Feed;
import kr.spring.project.rss.FeedMessage;
import kr.spring.project.rss.RSSFeedParser;
import kr.spring.project.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model, Criteria cri) {
		RSSFeedParser parser = new RSSFeedParser(
                "https://www.now.go.kr/ur/rss/UrRssView.do?rssType=TUR_POLI_TRND&rssSubType=OVER");
		Feed feed = parser.readFeed();
		//검색 전 게시글들
		List<FeedMessage> feedMessages = (List)feed.getMessages();
		//검색 후 게시글들
		List<FeedMessage> searchMessages = homeService.getListFeedMessage(feedMessages, cri);
		int totalCount = 0;
		if(searchMessages != null)
			totalCount = homeService.getCountListFeedMessage(feedMessages, cri);
		PageMaker pageMaker = homeService.getPageMaker(cri, 10, totalCount);
		model.addAttribute("size", totalCount);
		model.addAttribute("feed", searchMessages);
		model.addAttribute("pageMaker", pageMaker);
		return "home";
	}
	
}

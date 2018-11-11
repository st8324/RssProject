package kr.spring.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.project.pagination.Criteria;
import kr.spring.project.pagination.PageMaker;
import kr.spring.project.rss.Feed;
import kr.spring.project.rss.FeedMessage;
import kr.spring.project.rss.RSSFeedParser;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model, Criteria cri) {
		RSSFeedParser parser = new RSSFeedParser(
                "https://www.now.go.kr/ur/rss/UrRssView.do?rssType=TUR_POLI_TRND&rssSubType=OVER");
		Feed feed = parser.readFeed();
		
		int totalCount = feed.getMessages().size();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setDisplayPageNum(10);
		pageMaker.setTotalCount(totalCount);
		List<FeedMessage> feedMessages = (List)feed.getMessages();
		feedMessages = feedMessages.subList(cri.getPageStart(),cri.getPageStart()+cri.getPerPageNum());
		
		for (FeedMessage message : feedMessages) {
	        System.out.println(message);
		}
		model.addAttribute("size", totalCount);
		model.addAttribute("feed", feedMessages);
		model.addAttribute("pageMaker", pageMaker);
		return "home";
	}
	
}

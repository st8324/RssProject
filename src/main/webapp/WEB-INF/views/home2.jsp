<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.io.*,javax.xml.transform.*,javax.xml.transform.stream.*,javax.xml.transform.dom.*, javax.xml.parsers.* ,org.w3c.dom.*" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<div class="sub_head">
    <div class="sub_title">
        <h1>해외정책동향</h1>
    </div>
</div>

<div id="contents">
   
   <h2 class="first">해외정책동향 검색</h2>
    <form name="form_search" method="post" action="">
        <table class="table_t1" width="100%" cellspacing="0" summary="">
            <caption>해외정책동향 검색</caption>
            <colgroup>
                <col width="20%" />
                <col />
                <col width="20%" />
                <col />
            </colgroup>
            <tbody>
                <tr>
                    <th class="first"><label for="businessYear">제목</label></th>
                    <td><input id="governmentTitle" name="governmentTitle" type="text" size="30" value="${pSearchVO.governmentTitle}" /></td>
                    <th class="first"><label for="businessYear">국가</label></th>
                    <td>
                       <input id="governmentTitle" name="governmentTitle" type="text" size="30" value="${pSearchVO.governmentTitle}" />
                       <input type="submit" class="rbutton blue" value="검색" /> &nbsp; &nbsp; &nbsp; &nbsp; 
                         <input type="button" class="rbutton orange" onclick="get_Excel()" value="엑셀" />
                         
                    </td>
                </tr>
            </tbody>
        </table>
    </form><br />

   <%
      ServletContext context = getServletContext();
      String xslurl = context.getRealPath("/WEB-INF/jsp/bsite/trends/trends.xsl");
      File xsl = new File(xslurl);

      DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
      DocumentBuilder builder = factory.newDocumentBuilder();
      Document doc = builder.parse("https://www.now.go.kr/ur/rss/UrRssView.do?rssType=TUR_POLI_TRND&rssSubType=OVER"); 
 
      TransformerFactory f = TransformerFactory.newInstance();
      Transformer trans = f.newTransformer(new StreamSource(xsl));
      trans.setOutputProperty(OutputKeys.ENCODING, "utf-8");
      trans.transform(new DOMSource(doc), new StreamResult(out));
   %>
   
   <div class="clear"></div>     
</div>
</body>
</html>

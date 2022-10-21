package com.amazon.hp.util;

public class PagingUtil {
	private int startCount;	 // 한 페이지에서 보여줄 게시글의 시작 번호
	private int endCount;	 // 한 페이지에서 보여줄 게시글의 끝 번호
	private StringBuffer pagingHtml;// 페이지 표시 문자열

	/**
	 * currentPage : 현재페이지
	 * totalCount : 전체 게시물 수
	 * rowCount : 한 페이지의  게시물의 수
	 * pageCount : 한 화면에 보여줄 페이지 수
	 * pageUrl : 호출 페이지 url
	 * addKey : 부가적인 key 없을 때는 null 처리 (&num=23형식으로 전달할 것)
	 * */
	public PagingUtil(int currentPage, int totalCount, int rowCount,int pageCount, String pageUrl) {
		this(null,null,null,currentPage,totalCount,rowCount,pageCount,pageUrl);
	}
	public PagingUtil(int currentPage, int totalCount, int rowCount,int pageCount, String pageUrl, String addKey) {
		this(null,null,null,currentPage,totalCount,rowCount,pageCount,pageUrl);
	}
	public PagingUtil(String keyfield, String keyword, int currentPage, int totalCount, int rowCount,int pageCount,String pageUrl) {
		this(keyfield,keyword,null,currentPage,totalCount,rowCount,pageCount,pageUrl);
	}
	
	// VV 페이징 모듈의 기본세팅인데 홈페이지에서 페이징및 검색 사용하는 부분이 한군데 뿐이라 수정해서 세팅
	//public PagingUtil(String keyfield, String keyword, int currentPage, int totalCount, int rowCount,int pageCount,String pageUrl,String addKey) {	
	public PagingUtil(String searchText, String esti_type, String esti_stat, int currentPage, int totalCount, int rowCount,int pageCount,String pageUrl) {	
		//if(addKey == null) addKey = "";//부가키가 null 일때 ""처리
		if(searchText == null) searchText = "";	//추가
		if(esti_type == null) esti_type = "";	//추가
		if(esti_stat == null) esti_stat = "";	//추가
		
		// 전체 페이지 수
		int totalPage = (int) Math.ceil((double) totalCount / rowCount);
		if (totalPage == 0) {
			totalPage = 1;
		}
		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		
		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount = (currentPage - 1) * rowCount + 1;
		endCount = currentPage * rowCount;
		
		// 시작 페이지와 마지막 페이지 값 구하기.
		int startPage = (int) ((currentPage - 1) / pageCount) * pageCount + 1;
		int endPage = startPage + pageCount - 1;
		
		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		// 이전 block 페이지
		pagingHtml = new StringBuffer();
		if (currentPage > pageCount) {
			/*if(keyword==null){//검색 미사용시
				pagingHtml.append("<a href="+pageUrl+"?pageNum="+ (startPage - 1) + addKey +">");
			}else{
				pagingHtml.append("<a href="+pageUrl+"?keyfield="+keyfield+"&keyword="+keyword+"&pageNum="+ (startPage - 1) + addKey +">");
			}*/
			pagingHtml.append("<a href="+pageUrl+"?searchText="+searchText+"&esti_type="+esti_type+"&esti_stat="+esti_stat+"&pageNum="+ (startPage - 1) +">");
			pagingHtml.append("◁&nbsp; 이전");
			pagingHtml.append("</a>");
		}
		pagingHtml.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		//페이지 번호.현재 페이지는 빨간색으로 강조하고 링크를 제거.
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("<font color='red'>");
				pagingHtml.append(i);
				pagingHtml.append("</font>");
			} else {
				/*if(keyword==null){//검색 미사용시
					pagingHtml.append("&nbsp;&nbsp;<a href='"+pageUrl+"?pageNum=");
				}else{
					pagingHtml.append("&nbsp;&nbsp;<a href='"+pageUrl+"?keyfield="+keyfield+"&keyword="+keyword+"&pageNum=");
				}*/
				pagingHtml.append("<a href="+pageUrl+"?searchText="+searchText+"&esti_type="+esti_type+"&esti_stat="+esti_stat+"&pageNum=");
				pagingHtml.append(i);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
			pagingHtml.append("&nbsp;&nbsp;");
		}
		pagingHtml.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		// 다음 block 페이지
		if (totalPage - startPage >= pageCount) {
			/*if(keyword==null){//검색 미사용시
				pagingHtml.append("<a href="+pageUrl+"?pageNum="+ (endPage + 1) + addKey +">");
			}else{
				pagingHtml.append("<a href="+pageUrl+"?keyfield="+keyfield+"&keyword="+keyword+"&pageNum="+ (endPage + 1) + addKey +">");
			}*/
			pagingHtml.append("<a href="+pageUrl+"?searchText="+searchText+"&esti_type="+esti_type+"&esti_stat="+esti_stat+"&pageNum="+ (endPage + 1) + ">");
			pagingHtml.append("다음 &nbsp;▷");
			pagingHtml.append("</a>");
		}
	}
	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}
	public int getStartCount() {
		return startCount;
	}
	public int getEndCount() {
		return endCount;
	}

}

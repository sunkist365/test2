package magic.board;

public class MyUtil {
	
	//전체페이지 수 구하기
	//dataPerPage:한 화면에 표시할 데이터 갯수
	//totalData:전체 데이터 갯수
	public int getPageCount(int dataPerPage, int totalData) {
		int pageCount=0; //전체 페이지 수
		
		//dataPerPage = 10일때, totalData가 1~9 이면 pageCount는 0
		pageCount = totalData / dataPerPage;
		
		//여기서 totalData가 10의 배수일 때는 통과한다.   
		if(totalData % dataPerPage != 0) {
			pageCount++;
		}
		return pageCount;
	}
	
	//페이징 처리 메소드
	//currentPage: 현재 표시할 페이지
	//totalPage: 전체 페이지 수
	//listUrl:링크를 설정할 URL(list.jsp)
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		int numPerBlock = 5; 	//리스트 밑에 나오는 페이지번호 출력 갯수
		int currentPageSetup;	//표시할 첫 페이지의 -1 해준 값
		int page;				//하이퍼링크가 될 page index숫자
		
		StringBuffer sb = new StringBuffer();
		if(currentPage == 0 || totalPage==0) { //데이터가 없을 경우
			return "";
		}
	}
}

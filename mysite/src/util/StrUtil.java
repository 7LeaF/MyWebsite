package util;

import java.util.ArrayList;

import dto.BbsDto;

public class StrUtil {
	
	//데이터베이스에 저장되기 전 XSS 위험 요소 제거
	public String cleanXSS(String value) {
		value = value.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
		value = value.replaceAll("\\(", "&#40;").replaceAll("\\)", "&#41;");
		value = value.replaceAll("'", "&#39;");
		value = value.replaceAll("eval\\((.*)\\)", "");
		value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
		value = value.replaceAll("script", "");
		//value = value.replaceAll(" ", "&nbsp;");
		//value = value.replaceAll("\r\n", "<br>");
		
		return value;
	}
	
	//글내용 출력시 개행 및 띄어쓰기 처리
	public String conToView(String value){
		value = value.replaceAll(" ", "&nbsp;");
		value = value.replaceAll("\r\n", "<br>");
		return value;
	}

	
	public ArrayList<BbsDto> conToView(ArrayList<BbsDto> list, String... fields){
		//BoardList 용 필터 생성
		for(BbsDto dto: list){
			for(String field: fields){
				//방법 찾는 중
			}
		}
		
		
		return null;
	}
	
}

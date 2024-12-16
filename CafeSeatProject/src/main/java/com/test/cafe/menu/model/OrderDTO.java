package com.test.cafe.menu.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDTO {

	private String seq;
	private String seqPayment;
	private String seqProduct;
	private String seqOptions;
	private String totalCount;
	
	//MenuDTO 변수를 담기 위한 껍데기
	private String seqCategory;
	private String name;
	private String price;
	
	
	//totalPrice에 Getter 메서드로 사용됨
	//menulist.jsp에서 ${order.totalPrice}를 요청할 때 자동으로 실행됨 
	public String getTotalPrice() {
		try {

			int unitPrice = Integer.parseInt(price);
			int count = Integer.parseInt(totalCount);
			
			// 제품 수량에 따른 총가격
			return String.valueOf(unitPrice * count);

		} catch (Exception e) {
			System.out.println("OrderDTO.getTotalPrice");
			e.printStackTrace();
			return "0"; //파싱 오류가 있으면 0을 출력하게 설정
		}
	}
	
	
}

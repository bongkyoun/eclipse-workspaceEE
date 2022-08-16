<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.dto.Purchase_Item"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.dto.Purchase"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.service.PurchaseService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
    <%
    /*
 		주문내역 설명 
 		숫자가 많아지면 작동하지 않음
 		PurchaseDao의 메소드로 주문 내역을 불러오는데 이안에는 purchase_itemList는 들어있지 않음(null)
    */
    PurchaseService purchaseService = new PurchaseService();
    List<Purchase> purchaseList = purchaseService.p_list(s_u_id);
    %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>한샘몰 주문목록</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	function order_delete_all_action(){
		document.order_delete_all_form.action='order_delete_id_action.jsp';
		document.order_delete_all_form.method='POST';
		document.order_delete_all_form.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
<form name="order_delete_all_form" style="margin: 0">
</form>	
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>쇼핑몰 -
											주문 목록</b></td>
								</tr>
							</table> <!--form-->
							<form name="f" method="post">
								<table align=center width=80%  border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=145 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문내용</font></td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1><font>결제수단</font></td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1><font>총 결제 금액</font></td>
										<td width=136 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문상세보기</font></td>
										
									</tr>
										
									<!-- order start -->
									<%
									
									List<Purchase_Item> purchase_ItemList=null;
									String thename=null;
									for (Purchase purchase : purchaseList) {
										if(purchase.getO_ItemListNum()>1){
										thename= purchaseService.p_Detail(purchase.getO_No()).getPurchase_Itemlist().get(0).getProduct().getP_name()+"외"+(purchase.getO_ItemListNum()-1)+"종";
										}else{
											thename=purchaseService.p_Detail(purchase.getO_No()).getPurchase_Itemlist().get(0).getProduct().getP_name();
										}
									%>
									
									<tr>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1><%=thename%></td>
										
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=purchase.getO_PaySelect()%></td>
										<td width=136 height=26 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("#,###").format(purchase.getO_ItemTotPrice())%></td>
										<td width=80 height=26 align=center bgcolor="ffffff" class=t1><a
											href="order_detail.jsp?o_no=<%=purchase.getO_No()%>" class=m1>주문상세</a></td>
									</tr>
									<%
									}
									%>
									<!-- order end -->




								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp;
									<a href=product_list.jsp
										class=m1>계속 구경하기</a>
									<a href='javascript:order_delete_all_action();'
										class=m1>주문전체삭제</a>
									</td>
									
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
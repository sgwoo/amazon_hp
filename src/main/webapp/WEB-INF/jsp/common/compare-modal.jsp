<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->
<div class="modal fade" id="compare-modal" tabindex="-1" role="dialog" aria-labelledby="compare-modal" aria-hidden="true">
	<div class="modal-dialog  modal-lg">
	   	<div class="modal-content">
	       	<div class="modal-header">
	       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       		<h4 class="modal-title" id="myModalLabel">할부구입 vs 아마존카 장기대여 비용비교</h4>
	     	</div>
	     	<div class="modal-body" id="compare-print">
	     		<div>
	     			<h4><span class="glyphicon glyphicon-stats"></span>&nbsp;항목별 비교</h4>
	     			<div align="right">[단위:원]</div>
	     		</div>
		    	<table class="table desc-table table-bordered">
					<colgroup>
						<col width="3%"/>
						<col width="3%"/>
						<col width="15%"/>
						<col width="15%"/>
						<col width="15%"/>
						<col width="25%"/>
						<col width="15%"/>
					</colgroup>
					<tr>
						<th rowspan="2" colspan="3">구분</th>
						<th colspan="3">${data.A_B}개월 할부 구입</th>
						<th rowspan="2">아마존카<br/><!-- 장기렌트 기본식 -->
						<c:if test="${data.A_A=='11'}">오토리스 일반식</c:if>
						<c:if test="${data.A_A=='12'}">오토리스 기본식</c:if>
						<c:if test="${data.A_A=='21'}">장기렌트 일반식</c:if>
						<c:if test="${data.A_A=='22'}">장기렌트 기본식</c:if>
						<br/>(${data.A_B}개월)</th>
					</tr>
					<tr>
						<th>총비용(${data.A_B}개월)</th>
						<th colspan="2">산출기준</th>
					</tr>
					<tr>
						<td colspan="3" class="text-center">차량가격</td>
						<td class="text-center">
							${compareData.I67}
						</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.O67}" pattern="#,###"/></td>
						<td rowspan="3" class="text-center">${detailData.CAR_NM} ${detailData.CAR_NAME}</td>
						<c:choose>
							<c:when test="${((jgData.JG_G_7 ne 1 && jgData.JG_G_7 ne 2 && jgData.JG_G_7 ne 3 && jgData.JG_G_7 ne 4)&&(mainData.JG_G_7 ne 1 && mainData.JG_G_7 ne 2 && mainData.JG_G_7 ne 3 && mainData.JG_G_7 ne 4)&&(ecarFlag ne 1 && ecarFlag ne 2 && ecarFlag ne 3 && ecarFlag ne 4))}">
								<td rowspan="5"></td>
							</c:when>
							<c:otherwise>
								<td rowspan="7"></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td colspan="3" class="text-center">탁송료</td>
						<td class="text-center">서울기준</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.O68}" pattern="#,###"/></td>
					</tr>
					<tr>
						<td colspan="3" class="text-center">총차량가격</td>
						<td></td>
						<td class="text-right"><fmt:formatNumber value="${compareData.O69}" pattern="#,###"/></td>
					</tr>
					<c:if test="${((jgData.JG_G_7 eq 1 || jgData.JG_G_7 eq 2 || jgData.JG_G_7 eq 3 || jgData.JG_G_7 eq 4)||(mainData.JG_G_7 eq 1 || mainData.JG_G_7 eq 2 || mainData.JG_G_7 eq 3 || mainData.JG_G_7 eq 4)||(ecarFlag eq 1 || ecarFlag eq 2 || ecarFlag eq 3 || ecarFlag eq 4))}">
						<tr>
							<td colspan="3" class="text-center">
								<c:if test="${data.ECAR_PUR_SUB_AMT > 0}">친환경차 구매보조금</c:if>
							</td>
							<td></td>
							<td class="text-right"><fmt:formatNumber value="${data.ECAR_PUR_SUB_AMT}" pattern="#,###"/></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3" class="text-center">
								<c:if test="${data.ECAR_PUR_SUB_AMT > 0}">총차량가격-구매보조금</c:if>
							</td>
							<td></td>
							<td class="text-right"><fmt:formatNumber value="${compareData.O69-data.ECAR_PUR_SUB_AMT}" pattern="#,###"/></td>
							<td></td>
						</tr>
					</c:if>
					<tr>
						<td colspan="3" class="text-center">할부원금</td>
						<td></td>
						<td class="text-right"><fmt:formatNumber value="${compareData.O70}" pattern="#,###"/></td>
						<td class="text-center">메이커 선수금  <fmt:formatNumber value="${compareData.I72}" pattern="#,###"/>원 기준</td>
					</tr>
					<tr>
						<td colspan="3" class="text-center">월할부금</td>
						<td></td>
						<td class="text-right"><fmt:formatNumber value="${compareData.O71}" pattern="#,###"/> / 월</td>
						<td class="text-center">이자율 <fmt:formatNumber value="${compareData.AO70*10000/100}" pattern="#,###.0"/>%</td>
					</tr>
					<tr>
						<th rowspan="12">구입 및 유지</th>
						<td rowspan="5">구입</td>
						<td class="text-center">메이커 선수금</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I72}" pattern="#,###"/></td>
						<td class="text-right">총 차가의 <fmt:formatNumber value="${compareData.O72*1000/10}" pattern="#,###.0"/>%</td>
						<td><!-- =총차량가격 - 할부원금 --></td>
						<td rowspan="4">
							<fmt:formatNumber value="${compareData.AK78}" pattern="#,###"/>
						</td>
					</tr>
					<%-- <tr>
						<td>할부수수료</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I73}" pattern="#,###"/></td>
						<td></td>
						<td>할부원금 × <fmt:formatNumber value="${compareData.AO72*1000/10}" pattern="#,###"/>%</td>
					</tr>
					<tr>
						<td>인지대</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I74}" pattern="#,###"/></td>
						<td></td>
						<td>차입인지대</td>
					</tr> --%>
					<tr>
						<td class="text-center">통합취득세</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I75}" pattern="#,###"/></td>
						<td class="text-right"><fmt:formatNumber value="${compareData.O75*1000/10}" pattern="#,###.0"/>%</td>
						<td></td>
					</tr>
					<tr>
						<td class="text-center">공채할인</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I76}" pattern="#,###"/></td>
						<td></td>
						<td class="text-center">공채할인매도<br>(서울기준, 할인율 <fmt:formatNumber value="${compareData.AO77*1000/10}" pattern="#,###.0"/>%)</td>
					</tr>
					<tr>
						<td class="text-center">부대비용</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I77}" pattern="#,###"/></td>
						<td></td>
						<td class="text-center">번호판대 + 증지대 + 등록대행료 등</td>
					</tr>
					<%-- <tr>
						<td>취득세</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I78}" pattern="#,###"/></td>
						<td></td>
						<td>취득세(<fmt:formatNumber value="${compareData.O78*1000/10}" pattern="#,###"/>%) 30일 이내 납부</td>
					</tr> --%>
					<tr>
						<td class="primary-green text-center">구입단계 제비용</td>
						<td class="primary-green text-right"><fmt:formatNumber value="${compareData.I79}" pattern="#,###"/></td>
						<td colspan="2" class="text-right"></td>
						<td class="primary-green text-right"><fmt:formatNumber value="${compareData.AE79}" pattern="#,###"/></td>
					</tr>
					<tr>
						<td rowspan="6">유지</td>
						<td class="text-center">보험료</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I80}" pattern="#,###"/></td>
						<td class="text-right"><fmt:formatNumber value="${compareData.O80}" pattern="#,###"/>/년</td>
						<td class="text-center">법인업무용 종합보험(DB손해보험)</td>
						<td rowspan="5">
							월 대여료(VAT 포함)<Br/>
							<fmt:formatNumber value="${data.FEE_S_AMT + data.FEE_V_AMT}" pattern="#,###"/> /월<br/><br/><br/>
							※ 추가 비용 없이 좌측의 해당 서비스 제공
						</td>
					</tr>
					<tr>
						<td class="text-center">할부금</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I81}" pattern="#,###"/></td>
						<td></td>
						<td class="text-center">= 월할부금 × 할부개월수</td>
					</tr>
					<tr>
						<td class="text-center">자동차세</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I82}" pattern="#,###"/></td>
						<td class="text-right"><fmt:formatNumber value="${compareData.O82}" pattern="#,###"/> / 년</td>
						<td class="text-center">이용기간 연 평균 자동차세</td>
					</tr>
					<%-- <tr>
						<td>환경개선부담금</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I83}" pattern="#,###"/></td>
						<td class="text-right"><fmt:formatNumber value="${compareData.O83}" pattern="#,###"/> / 년</td>	
						<td>경유자동차에 부과(3,9월 납입)</td>
					</tr> --%>
					<tr>
						<td class="text-center">사고 처리 및 <br/>사고 대차</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I84}" pattern="#,###"/></td>
						<td class="text-right"><fmt:formatNumber value="${compareData.O84}" pattern="#,###"/> / 년</td>
						<td class="text-center">아마존카 전 상품 기본 제공 서비스<br/>(자차, 가해 사고시에도 무료 대차)</td>
					</tr>
					<tr>
						<td class="text-center">정비관리 일체<br/>및 정비대차</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I85}" pattern="#,###"/></td>
						<td class="text-right"><fmt:formatNumber value="${compareData.O85}" pattern="#,###"/> / 월</td>
						<td class="text-center">아마존카 일반식 상품 제공 서비스</td>
					</tr>
					<tr>
						<td class="primary-green text-center">유지단계 제비용</td>
						<td class="primary-green text-right"><fmt:formatNumber value="${compareData.I86}" pattern="#,###"/></td>
						<td colspan="2"></td>
						<td class="primary-green text-right"><fmt:formatNumber value="${compareData.AE86}" pattern="#,###"/></td>
					</tr>
					<tr class="primary-line-orange">
						<td colspan="2" class="text-center">구입/유지총비용(ⓐ)</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I87}" pattern="#,###"/></td>
						<td colspan="2"></td>
						<td class="text-right"><fmt:formatNumber value="${compareData.AE87}" pattern="#,###"/></td>
					</tr>
					<tr>
						<td colspan="3" class="text-center">중고차 매각 가격</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I88}" pattern="#,###"/></td>
						<td colspan="2" class="text-center">신차 가격의 <fmt:formatNumber value="${compareData.AO86*1000/10}" pattern="#,###.0"/>%에 매각</td>
						<td rowspan="2" class="text-center">보증금 환불액</td>
					</tr>
					<tr>
						<td colspan="3" class="text-center">매각 부가세</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I89}" pattern="#,###"/></td>
						<td colspan="2" class="text-center">매각 시 매각 가격의 10% 부가세 납입해야 함</td>
					</tr>
					<tr class="primary-line-orange">
						<td colspan="3" class="text-center">중고차매각수입(ⓑ)</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.I90}" pattern="#,###"/></td>
						<td colspan="2" class="text-center">= 중고차 매각 가격 - 매각 부가세</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.AE90}" pattern="#,###"/></td>
					</tr>
					<tr class="primary-line-orange">
						<td colspan="3" class="text-center">${data.A_B}개월 차량 이용에 따른 순비용</td>
						<td class="primary-orange text-bold text-right"><fmt:formatNumber value="${compareData.I91}" pattern="#,###"/></td>
						<td colspan="2" class="text-center">= ⓐ - ⓑ</td>
						<td class="text-right"><fmt:formatNumber value="${compareData.AE91}" pattern="#,###"/></td>
					</tr>
					<tr>
						<td colspan="7" class="primary-orange text-bold" style="font-size:14px;">
							할부 구입 대비 &nbsp;: &nbsp;
							<c:if test="${compareData.AE93>0}">+</c:if>
							<fmt:formatNumber value="${compareData.AE93}" pattern="#,###"/>
						</td>
					</tr>
		    	</table>
		    	<h4><span class="glyphicon glyphicon-stats"></span>&nbsp;세금감면효과<small>(대여료 손비처리에 따른 세금 감면 효과)</small></h4>
		    	<div class="row">
		   			<div class="col-md-6">
		   				<table width="100%">
		   					<tr>
		   						<td width="80%">
					   				<h5><span class="glyphicon glyphicon-play-circle"></span>&nbsp;법인</h5>
		   						</td>
		   						<td width="20%" align="right">
					   				<div class="text-right">(주민세 포함)</div>
		   						</td>
		   					</tr>
		   				</table>
		   				<table class="desc-table table table-bordered">
		   					<colgroup>
		   						<col width="23%"/>
		   						<col width="23%"/>
		   						<col width="23%"/>
		   						<col width="31%"/>
		   					</colgroup>
		   					<tr>
		   						<th>연간 순이익</th>
		   						<th>법인세율</th>
		   						<th>손비처리액</th>
		   						<th>법인세 절감액</th>
		   					</tr>
		   					<tr>
		   						<td class="text-center">2억 이하</td>
		   						<td class="text-center">11.0%</td>
		   						<td class="text-right"><fmt:formatNumber value="${compareData.AE91}" pattern="#,###"/></td>
		   						<td class="primary-green text-bold text-right">
		   							<fmt:formatNumber value="${compareData.AE91*0.11}" pattern="#,###"/>
		   						</td>
		   					</tr>
		   					<tr>
		   						<td class="text-center">200억 이하</td>
		   						<td class="text-center">22.0%</td>
		   						<td class="text-right"><fmt:formatNumber value="${compareData.AE91}" pattern="#,###"/></td>
		   						<td class="primary-green text-bold text-right">
		   							<fmt:formatNumber value="${compareData.AE91*0.22}" pattern="#,###"/>
		   						</td>
		   					</tr>
		   					<tr>
		   						<td class="text-center">200억 초과</td>
		   						<td class="text-center">24.2%</td>
		   						<td class="text-right"><fmt:formatNumber value="${compareData.AE91}" pattern="#,###"/></td>
		   						<td class="primary-green text-bold text-right"><fmt:formatNumber value="${compareData.AE91*0.242}" pattern="#,###"/></td>
		   					</tr>
		   				</table>
		   				<small>* 차량구입 이용시에도 대부분 비용처리가 가능하나, 회계처리가 매우 복잡합니다.</small><br><br>
		   				<small>* 승용차(경차,9인승 제외)의 경우 차량구입과 장기렌트/리스 모두 임직원 전용 자동차 보험을 가입하고, 법인세법상 손비처리 기준에 따라 손비처리 가능 (당사 홈페이지 '업무용승용차 손비처리 기준' 참고)</small>
		   			</div>
		   			<div class="col-md-6">
		   				<table width="100%">
		   					<tr>
		   						<td width="80%">
					   				<h5><span class="glyphicon glyphicon-play-circle"></span>&nbsp;개인사업자</h5>
		   						</td>
		   						<td width="20%" align="right">
					   				<div class="text-right">(주민세 포함)</div>
		   						</td>
		   					</tr>
		   				</table>
		   				<table class="desc-table table table-bordered">
		   					<colgroup>
		   						<col width="30%"/>
		   						<col width="20%"/>
		   						<col width="20%"/>
		   						<col width="30%"/>
		   					</colgroup>
		   					<tr>
		   						<th>연간 소득</th>
		   						<th>소득세율</th>
		   						<th>손비처리액</th>
		   						<th>소득세 절감액</th>
		   					</tr>
		   					<tr>
		   						<td class="text-center">4600만원 이하</td>
		   						<td class="text-center">16.5%</td>
		   						<td class="text-right"><fmt:formatNumber value="${compareData.AE91}" pattern="#,###"/></td>
		   						<td class="primary-green text-bold text-right"><fmt:formatNumber value="${compareData.AE91*0.165}" pattern="#,###"/></td>
		   					</tr>
		   					<tr>
		   						<td class="text-center">8800만원 이하</td>
		   						<td class="text-center">26.4%</td>
		   						<td class="text-right"><fmt:formatNumber value="${compareData.AE91}" pattern="#,###"/></td>
		   						<td class="primary-green text-bold text-right">
		   							<fmt:formatNumber value="${compareData.AE91*0.264}" pattern="#,###"/>
		   						</td>
		   					</tr>
		   					<tr>
		   						<td class="text-center">1억 5천만원 이하</td>
		   						<td class="text-center">38.5%</td>
		   						<td class="text-right"><fmt:formatNumber value="${compareData.AE91}" pattern="#,###"/></td>
		   						<td class="primary-green text-bold text-right"><fmt:formatNumber value="${compareData.AE91*0.385}" pattern="#,###"/></td>
		   					</tr>
		   					<tr>
		   						<td class="text-center">1억 5천만원 초과</td>
		   						<td class="text-center">41.8%</td>
		   						<td class="text-right"><fmt:formatNumber value="${compareData.AE91}" pattern="#,###"/></td>
		   						<td class="primary-green text-bold text-right">
		   							<fmt:formatNumber value="${compareData.AE91*0.418}" pattern="#,###"/>
		   						</td>
		   					</tr>
		   				</table>
		   				<small> * 차량구입 이용시 손비처리가 안 될 경우도 있으나, 장기렌트/리스 이용시에는 쉽게 손비처리 가능합니다.</small><br>
		   				<small> * 승용차(경차,9인승 제외)의 경우 2016년 소득세법부터 적용되고 있는 업무용승용차 손비처리 기준에 따라 손비처리 가능 (당사 홈페이지 '업무용승용차 손비처리 기준' 참고)</small>
		   			</div>
	   			</div>
	   			<div class="panel panel-default" style="margin-top:10px;">
					<div class="panel-body">
						<h5>아마존카 장기대여 이용시 회계처리</h5>
						<p class="desc-paragraph">
					    	1) 대여료 손비처리시 회계처리가 매우 간편합니다.(매월 발부되는 세금계산서 1장으로 비용처리 완료)<br/>
					    	2) 차량구입 이용시 손비처리가 불가능하거나, 어려운 경우에도 쉽게 손비처리 할 수 있습니다.(개인사업자, 변호사 등)<br/>
					    	3) 할부구입이나 일반 캐피탈사 리스 이용시 금융권 전산에 대출이 있는 것으로 처리 되지만, 아마존카 장기렌트/리스 이용시 대출로 잡히지 않습니다.
				    	</p>
					</div>
				</div>
	   		</div>
	   		
	    	<div class="modal-footer">
	    		<button type="button" class="btn btn-default-reverse" id="compare-print-btn">인쇄하기</button>
	       		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	    	</div>
		 </div>
	</div>
</div>
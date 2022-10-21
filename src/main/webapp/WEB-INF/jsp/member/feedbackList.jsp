<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType = "text/html;charset=UTF-8" %>

<t:genericpage>

<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" href="/resources/stylesheets/module.css" />
<link rel="stylesheet" href="/resources/stylesheets/mypage.css" />

<script>

// 리스트 확장
$('document').ready(function() {
	
	// 서버정비관련 상담요청 및 예약 제한(2018.01.20 ~)
	/* $("#no-write").on("click", function(){
		alert("현재, 서버 정비작업으로 인해 불편사항 작성하기가 불가능 합니다.\n\n(견적 및 조회 등은 가능)\n\n빠른 시일내로 정상서비스 제공을 위해 노력하겠습니다.\n\n예상작업 시간 : 2018-01-19 18:00 ~ 2018-01-22 09:00\n\n- 아마존카 -");
		return false;
	}); */
	
	
    $(".mypage-list-row-stretch").bind("click", function() {
		//$('.mypage-list-row-stretch').find('.mypage-list-oneline').css('white-space', 'nowrap')
        if ($(this).find(".mypage-list-oneline").css("white-space") == "nowrap") {
            
        	$(this).find(".mypage-list-oneline").css("white-space", "normal").css("padding-top", "10px").css("padding-bottom", "10px");
			//$(this).find('.mypage-list-oneline').html().replace(/\n/g, '<br />');
            $(this).find(".mypage-list-oneline").each(function() {
                $(this).html($(this).html().replace(/\n/g, "<br>"));
            });

        } else {
            
        	$(this).find(".mypage-list-oneline").css("white-space", "nowrap").css("padding-top", "").css("padding-bottom", "");

            $(this).find(".mypage-list-oneline").each(function() {
                $(this).html($(this).html().replace(/<br>/g, "\n"));
			});
		}
    });
})

</script>

<div class="amazon-detail">

    <div class="amazon-tab-container">
        <div class="amazon-tabs">
            <a href="/mypage/rent/list"><div class="amazon-tab">견적/상담/예약 이력</div></a>
            <a href="/mypage/info"><div class="amazon-tab">회원정보 변경</div></a>
            <a href="/mypage/feedback/list"><div class="amazon-tab active">불편합니다</div></a>
        </div>
    </div>

    <div class="amazon-tap-main">
        <p class="mypage-feedback-list-submit">
        	<!-- 서버정비관련 상담요청 및 예약 제한(2018.01.20 ~) -->
            <button class="btn btn-success" onclick="location.href='/feedback'">작성하기</button>
            <!-- <button class="btn btn-success" id="no-write">작성하기</button> -->
        </p>
        <table class="mypage-list">
            <colgroup>
                <col width="10%"/>
                <col width="25%"/>
                <col width="55%"/>
                <col width="10%"/>
            </colgroup>
            <thead>
            <tr>
                <th>접수일자</th>
                <th>제목</th>
                <th>불편사항</th>
                <th>이용여부</th>
            </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty list}">
                        <c:forEach var="data" items="${list}" varStatus="status">
                            <tr class="mypage-list-row-stretch">
                                <td>${data.REG_DT}</td>
                                <td class="mypage-list-oneline">${data.TITLE}</td>
                                <td class="mypage-list-oneline mypage-list-left">${data.CONTENTS}</td>
                                <td>
                                    <c:if test="${data.ACAR_USE == 1}">
                                        이용중
                                    </c:if>
                                    <c:if test="${data.ACAR_USE != 1}">
                                        이용안함
                                    </c:if>
                                </td>
                            </tr>
                            <c:if test="${data.ANS_DT != null}">
                                <tr class="mypage-list-answer">
                                    <td></td>
                                    <td></td>
                                    <td class="mypage-list-oneline"><i class="fa fa-arrow-right" aria-hidden="true"></i>${data.ANSWER} (${data.ANS_DT})</td>
                                    <td></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="4">접수 내역이 없습니다</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>        
    </div>
</div>
</t:genericpage>
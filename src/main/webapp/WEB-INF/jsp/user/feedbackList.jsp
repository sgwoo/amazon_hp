<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType = "text/html;charset=UTF-8" %>
<t:genericpage>
<div class="amazon-detail">
	<ul class="nav nav-pills">
		<li role="presentation"><a href="/mypage">회원정보 변경</a></li>
		<li role="presentation" class="active"><a href="#">불편합니다</a></li>
	</ul>
	<h2>나의 접수내역</h2>
        <c:choose>
          <c:when test="${fn:length(list) > 0}">
            <div class="panel-group" id="accordion" role="tablist"
                    aria-multiselectable="true">
              <c:forEach items="${list }" var="row" varStatus="status">
                <div class="panel panel-default">
                  <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" data-parent="#accordion"
                                        href="#collapse${status.index}" aria-expanded="true"
                                        aria-controls="collapseOne">
                        ${row.TITLE}
                     </a>
                   </h4>
                 </div>
                    <div id="collapse${status.index}"
                                class="${status.index eq 0 ? 'panel-collapse collapse in':'panel-collapse collapse ${i}'}"
                                role="tabpanel" aria-labelledby="headingOne">
                      <div class="panel-body">
                      	   접수일자 : ${row.REG_DT}<br/>
                          <c:out escapeXml="false"
                                        value="${fn:replace(row.CONTENTS,ENTER,'<br>')}" /> 
                       </div>
                    </div>
                 </div>
              </c:forEach>
            </div>
          </c:when>
        </c:choose>	
</div>
</t:genericpage>
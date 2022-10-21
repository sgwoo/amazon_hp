<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <H2>공지사항</H2>
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
                       [제목]${row.title }
                     </a>
                   </h4>
                 </div>
                    <div id="collapse${status.index}"
                                class="${status.index eq 0 ? 'panel-collapse collapse in':'panel-collapse collapse ${i}'}"
                                role="tabpanel" aria-labelledby="headingOne">
                      <div class="panel-body">
                          <c:out escapeXml="false"
                                        value="${row.contents}" /> 
                       </div>
                    </div>
                 </div>
              </c:forEach>
            </div>
          </c:when>
        </c:choose>
</body>
</html>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'submission.label', default: 'Submission')}" />
    <sec:ifAllGranted roles="ROLE_ADMIN">
      <g:set var="pageTitle" value="All Talk Submissions"/>
    </sec:ifAllGranted>
    <sec:ifNotGranted roles="ROLE_ADMIN">
      <g:set var="pageTitle" value="Your Talk Submissions"/>
    </sec:ifNotGranted>
    <title>${pageTitle}</title>
  </head>
  <body>
    <a href="#list-submission" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
      <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
      </ul>
    </div>
    <div id="list-submission" class="content scaffold-list" role="main">
      <h1>${pageTitle}</h1>
      <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>
          
            <g:sortableColumn property="title" title="${message(code: 'submission.title.label', default: 'Title')}" />
          
            <g:sortableColumn property="summary" title="${message(code: 'submission.summary.label', default: 'Summary')}" />
          
            <g:sortableColumn property="accepted" title="${message(code: 'submission.accepted.label', default: 'Accepted')}" />
          
            <g:sortableColumn property="schedule" title="${message(code: 'submission.schedule.label', default: 'Schedule')}" />
          
            <sec:ifAllGranted roles="ROLE_ADMIN">
            <th><g:message code="submission.user.label" default="User" /></th>
            </sec:ifAllGranted>
          
          </tr>
        </thead>
        <tbody>
        <g:each in="${submissionInstanceList}" status="i" var="submissionInstance">
          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
          
            <td><g:link action="show" id="${submissionInstance.id}">${fieldValue(bean: submissionInstance, field: "title")}</g:link></td>
          
            <td>${fieldValue(bean: submissionInstance, field: "summary")}</td>
          
            <td>
              <g:if test="${submissionInstance.accepted == null}"><em>Pending</em></g:if>
              <g:else>${submissionInstance.accepted ? 'Yes' : 'No'}</g:else>
            </td>
          
            <td><g:formatDate date="${submissionInstance.schedule}" /></td>
          
            <sec:ifAllGranted roles="ROLE_ADMIN">
            <g:set var="currProfile" value="${submissionInstance?.user?.profile}"/>
            <td><g:link controller="profile" action="show" id="${currProfile?.id}">${currProfile?.name}</g:link></td>
            </sec:ifAllGranted>
          
          </tr>
        </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${submissionInstanceTotal}" />
      </div>
    </div>
  </body>
</html>
